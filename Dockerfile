# --- Build Stage ---
FROM rust:1.88 AS builder

WORKDIR /app

ENV SQLX_OFFLINE=true

# Copy manifests to cache deps early (minimize rebuilds)
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

COPY .sqlx .sqlx

# Dummy main.rs for caching deps (to speed up rebuilds)
RUN mkdir -p pointercrate-example/src && echo "fn main() {}" > pointercrate-example/src/main.rs
RUN mkdir -p trlist-pointercrate-migration/src && echo "fn main() {}" > trlist-pointercrate-migration/src/main.rs
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration || true

# Copy full source for actual build
COPY . .

RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration

# Strip binaries to reduce size
RUN apt-get update && apt-get install -y binutils && \
    strip target/release/pointercrate-example && \
    strip target/release/trlist-pointercrate-migration && \
    apt-get remove -y binutils && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# --- Runtime Stage ---
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libssl-dev ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/migrations /app/migrations
COPY --from=builder /app/target/release/pointercrate-example /app/bin/pointercrate-example
COPY --from=builder /app/target/release/trlist-pointercrate-migration /app/bin/trlist-pointercrate-migration
COPY --from=builder /app/pointercrate-core-pages/static /app/pointercrate-core-pages/static
COPY --from=builder /app/pointercrate-demonlist-pages/static /app/pointercrate-demonlist-pages/static
COPY --from=builder /app/pointercrate-example/static /app/pointercrate-example/static
COPY --from=builder /app/pointercrate-user-pages/static /app/pointercrate-user-pages/static
COPY --from=builder /app/trlist-pointercrate-migration/tsl_data /app/trlist-pointercrate-migration/tsl_data


RUN chmod +x /app/bin/pointercrate-example /app/bin/trlist-pointercrate-migration

# Copy entrypoint and make executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8080
ENV ROCKET_ENV=production
ENV LIST_SIZE=50
ENV EXTENDED_LIST_SIZE=100

EXPOSE 8080

CMD ["/app/entrypoint.sh"]
