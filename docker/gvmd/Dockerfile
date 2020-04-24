FROM isaudits/gvm:openvas

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build /install/gvmd/ /usr/local/

COPY root/ /


