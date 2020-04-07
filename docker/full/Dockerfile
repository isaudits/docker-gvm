FROM isaudits/gvm:openvas

RUN cd /install/ && \
    tar -xf gvm_libs.tar.gz -C / && \
    tar -xf gvmd.tar.gz -C / && \
    tar -xf gsa.tar.gz -C /

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY root/ /


