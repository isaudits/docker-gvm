FROM isaudits/gvm:openvas-20.8

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build-20.8 /install/gvmd/ /install/gsa/ /usr/local/

#Grab report_formats from previous version so they can be migrated in case of an upgrade
COPY --from=isaudits/gvm:gvm-11 /usr/local/share/gvm/gvmd/report_formats/ /usr/local/share/gvm/gvmd/report_formats/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers

COPY root/ /


