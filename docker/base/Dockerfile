FROM lsiobase/ubuntu:bionic 

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build /install/gvm_libs/ /usr/local/

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