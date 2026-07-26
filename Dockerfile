FROM rust:1.88 AS builder

WORKDIR /app

ENV SQLX_OFFLINE=true

COPY . .

RUN cargo build --release \
    -p pointercrate-example \
    -p trlist-pointercrate-migration


FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libssl-dev \
        ca-certificates \
        file && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder \
    /app/target/release/pointercrate-example \
    /app/bin/pointercrate-example

COPY --from=builder \
    /app/target/release/trlist-pointercrate-migration \
    /app/bin/trlist-pointercrate-migration

# Only copy runtime data that is actually needed
COPY pointercrate-example/static/ /app/pointercrate-example/static/
COPY pointercrate-core-pages/static/ /app/pointercrate-core-pages/static/
COPY pointercrate-demonlist-pages/static/ /app/pointercrate-demonlist-pages/static/
COPY pointercrate-user-pages/static/ /app/pointercrate-user-pages/static/

COPY pointercrate-demonlist/sql/ /app/pointercrate-demonlist/sql/
COPY pointercrate-user/sql/ /app/pointercrate-user/sql/

# Migration data
COPY trlist-pointercrate-migration/tsl_data/ /app/trlist-pointercrate-migration/tsl_data/

ENV ROCKET_PROFILE=production \
    ROCKET_LOG_LEVEL=normal \
    LIST_SIZE=75 \
    EXTENDED_LIST_SIZE=150

EXPOSE 8080

CMD ["/app/bin/pointercrate-example"]