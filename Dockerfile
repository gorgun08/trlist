FROM rust:1.88 AS builder

WORKDIR /app

ENV SQLX_OFFLINE=true

# Copy only dependency manifests first (cache layer)
COPY Cargo.toml Cargo.lock ./
COPY pointercrate-core/Cargo.toml pointercrate-core/
COPY pointercrate-core-api/Cargo.toml pointercrate-core-api/
COPY pointercrate-core-pages/Cargo.toml pointercrate-core-pages/
COPY pointercrate-core-macros/Cargo.toml pointercrate-core-macros/
COPY pointercrate-demonlist/Cargo.toml pointercrate-demonlist/
COPY pointercrate-demonlist-api/Cargo.toml pointercrate-demonlist-api/
COPY pointercrate-demonlist-pages/Cargo.toml pointercrate-demonlist-pages/
COPY pointercrate-integrate/Cargo.toml pointercrate-integrate/
COPY pointercrate-user/Cargo.toml pointercrate-user/
COPY pointercrate-user-api/Cargo.toml pointercrate-user-api/
COPY pointercrate-user-pages/Cargo.toml pointercrate-user-pages/
COPY pointercrate-test/Cargo.toml pointercrate-test/
COPY pointercrate-example/Cargo.toml pointercrate-example/
COPY trlist-pointercrate-migration/Cargo.toml trlist-pointercrate-migration/


# Create dummy src files so cargo can build deps without real source
RUN find . -name "Cargo.toml" -not -path "./Cargo.toml" | while read f; do \
    dir=$(dirname $f); \
    mkdir -p $dir/src && echo "fn main() {}" > $dir/src/main.rs && echo "" > $dir/src/lib.rs; \
    done

# Cache dependencies
RUN cargo fetch
RUN cargo build --release -p pointercrate-example -p trlist-pointercrate-migration || true

# Now copy real source
COPY . .

# Touch to force recompile of real source
RUN find . -name "*.rs" -not -path "*/target/*" | xargs touch

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
ENV ROCKET_LOG_LEVEL=normal

ENV LIST_SIZE=75
ENV EXTENDED_LIST_SIZE=150
ENV DISCORD_WEBHOOK=""
ENV LIST_MOD_ROLE_ID="1128817111364538459"

EXPOSE 8080

CMD ["/app/bin/pointercrate-example"]
