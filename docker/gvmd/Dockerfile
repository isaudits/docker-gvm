FROM isaudits/gvm:openvas-7

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build-11 /install/gvmd/ /usr/local/

COPY root/ /


