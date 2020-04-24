FROM isaudits/gvm:gvmd

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build /install/gsa/ /usr/local/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers

COPY root/ /


