# --- Build Stage ---
FROM rust:1.88 as builder

WORKDIR /app

# Enable SQLx offline mode during build (important!)
ENV SQLX_OFFLINE=true

# Copy manifest files for workspace crates (to cache deps)
COPY Cargo.toml Cargo.lock ./
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

# Copy .sqlx metadata folder for offline mode validation
COPY .sqlx .sqlx

# Create dummy main files to cache dependencies without real code
RUN mkdir -p pointercrate-example/src && echo "fn main() {}" > pointercrate-example/src/main.rs
RUN mkdir -p trlist-pointercrate-migration/src && echo "fn main() {}" > trlist-pointercrate-migration/src/main.rs
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration || true

# Copy the entire source code after caching dependencies
COPY . .

# Build the actual binaries
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration

# --- Runtime Stage ---
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    libssl-dev ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy built binaries from builder stage
COPY --from=builder /app/target/release/pointercrate-example /app/
COPY --from=builder /app/target/release/trlist-pointercrate-migration /app/

# Rocket environment config
ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8080
ENV ROCKET_ENV=production

# Your app-specific env vars (no spaces around =)
ENV LIST_SIZE=50
ENV EXTENDED_LIST_SIZE=100

EXPOSE 8080

# Entrypoint script that runs migration then server
CMD /app/trlist-pointercrate-migration && /app/pointercrate-example
