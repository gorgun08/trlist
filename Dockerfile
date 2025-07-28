# --- Build Stage ---
FROM rust:1.88 as builder

WORKDIR /app

# Copy the manifest and workspace definition
COPY Cargo.toml Cargo.lock ./

# Pre-copy each subcrate’s Cargo.toml (to cache deps)
COPY pointercrate-example/Cargo.toml pointercrate-example/Cargo.toml
COPY pointercrate-core/Cargo.toml pointercrate-core/Cargo.toml
COPY pointercrate-core-api/Cargo.toml pointercrate-core-api/Cargo.toml
COPY pointercrate-core-macros/Cargo.toml pointercrate-core-macros/Cargo.toml
COPY pointercrate-demonlist/Cargo.toml pointercrate-demonlist/Cargo.toml
COPY pointercrate-demonlist-api/Cargo.toml pointercrate-demonlist-api/Cargo.toml
COPY pointercrate-demonlist-pages/Cargo.toml pointercrate-demonlist-pages/Cargo.toml
COPY pointercrate-integrate/Cargo.toml pointercrate-integrate/Cargo.toml
COPY pointercrate-user/Cargo.toml pointercrate-user/Cargo.toml
COPY pointercrate-user-api/Cargo.toml pointercrate-user-api/Cargo.toml
COPY pointercrate-user-pages/Cargo.toml pointercrate-user-pages/Cargo.toml
COPY trlist-pointercrate-migration/Cargo.toml trlist-pointercrate-migration/Cargo.toml

# Create dummy main for caching
RUN mkdir -p pointercrate-example/src && echo "fn main() {}" > pointercrate-example/src/main.rs
RUN mkdir -p trlist-pointercrate-migration/src && echo "fn main() {}" > trlist-pointercrate-migration/src/main.rs
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration || true

# Copy the full source tree
COPY . .

# Build actual binaries
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration

# --- Runtime Stage ---
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    libssl-dev ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy both binaries
COPY --from=builder /app/target/release/pointercrate-example /app/
COPY --from=builder /app/target/release/trlist-pointercrate-migration /app/

# Rocket config
ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8080
ENV ROCKET_ENV=production

ENV LIST_SIZE = 50
ENV EXTENDED_LIST_SIZE = 100

ENV SQLX_OFFLINE=true



EXPOSE 8080

# Entrypoint runs the migration, then the server
CMD /app/trlist-pointercrate-migration && /app/pointercrate-example
