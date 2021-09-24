FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
        ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN curl -O 'https://builds.clickhouse.tech/master/aarch64/clickhouse' && \
    curl -O 'https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/programs/server/config.xml' && \
    curl -O 'https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/programs/server/users.xml' && \
    chmod +x ./clickhouse

ENTRYPOINT ["/app/clickhouse", "server", "--", "--listen_host", "0.0.0.0"]
