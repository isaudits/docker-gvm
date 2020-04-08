FROM isaudits/gvm:base

#RUN cd /install/ && \
#    tar -xf gvm_libs.tar.gz -C / && \
#    tar -xf openvas_smb.tar.gz -C / && \
#    tar -xf openvas_scanner.tar.gz -C / && \
#    echo "/usr/local/lib" > /etc/ld.so.conf.d/openvas.conf && ldconfig

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build /install/gvm_libs/ /install/openvas_smb/ /install/openvas_scanner/ /usr/local/

COPY --from=isaudits/gvm:build /install/gvmd/bin/gvm-manage-certs /usr/local/bin/gvm-manage-certs

RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/openvas.conf && ldconfig

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/openvas" >> /etc/sudoers

COPY root/ /


