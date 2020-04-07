FROM lsiobase/ubuntu:bionic

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ca-certificates \
    wget \
    curl \
    git \
    sudo \
    net-tools \
    iputils-ping \
    bzip2 \
    cron \
    rsync && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=isaudits/gvm:build /install/ /install/

COPY root/ /

ENV UPDATE_ON_START=true \
    GVM_USER="admin" \
    GVM_PASSWORD="admin" \
    GVMD_HOST="0.0.0.0" \
    GVMD_PORT="9390" \
    OPENVAS_HOST="0.0.0.0" \
    OPENVAS_PORT="9391" \
    GSA_HOST="0.0.0.0" \
    GSA_PORT="9392" \
    PG_MAJOR="10" \
    PGDATA="/var/lib/postgresql/data" \
    POSTGRES_DB="gvmd"