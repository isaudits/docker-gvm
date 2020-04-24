FROM isaudits/gvm:base

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build /install/openvas_smb/ /install/openvas_scanner/ /usr/local/

RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/openvas.conf && ldconfig

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/openvas" >> /etc/sudoers

COPY root/ /


