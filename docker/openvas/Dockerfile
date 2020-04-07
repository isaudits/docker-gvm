FROM isaudits/gvm:base

RUN cd /install/ && \
    tar -xf gvm_libs.tar.gz -C / && \
    tar -xf openvas_smb.tar.gz -C / && \
    tar -xf openvas_scanner.tar.gz -C / && \
    echo "/usr/local/lib" > /etc/ld.so.conf.d/openvas.conf && ldconfig

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY root/ /


