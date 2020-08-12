FROM isaudits/gvm:base-20.8

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build-20.8 /install/openvas_smb/ /install/openvas_scanner/ /usr/local/

RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/openvas.conf && ldconfig

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/openvas" >> /etc/sudoers

COPY root/ /


