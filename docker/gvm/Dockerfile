FROM isaudits/gvm:openvas-7

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build-11 /install/gvmd/ /install/gsa/ /usr/local/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers

COPY root/ /


