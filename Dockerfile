FROM rust:1.88 AS builder

WORKDIR /app

ENV SQLX_OFFLINE=true

# Copy everything into the container
COPY . .

# Pre-build to cache deps
RUN cargo fetch

# Actual build
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration

# --- Runtime Image ---
FROM debian:bookworm-slim

WORKDIR /app

# Install required system libs
RUN apt-get update && apt-get install -y libssl-dev ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y file


# Copy built binaries
COPY --from=builder /app/target/release/pointercrate-example /app/bin/pointercrate-example
COPY --from=builder /app/target/release/trlist-pointercrate-migration /app/bin/trlist-pointercrate-migration

# Copy ENTIRE project tree (preserves all relative paths for things like `sql/`, `static/`)
COPY . .

# Entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN ls -l /app/entrypoint.sh
RUN cat /app/entrypoint.sh
RUN file /app/entrypoint.sh
RUN head -n 3 /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set environment variables
ENV ROCKET_PROFILE=production

ENV LIST_SIZE=50
ENV EXTENDED_LIST_SIZE=100

EXPOSE 8080

CMD ["/app/entrypoint.sh"]
