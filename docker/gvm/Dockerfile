FROM isaudits/gvm:gvmd-9

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build-11 /install/gsa/ /usr/local/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers

COPY root/ /


