FROM isaudits/gvm:openvas-osp

#RUN cd /install/ && \
#    tar -xf gvm_libs.tar.gz -C / && \
#    tar -xf gvmd.tar.gz -C / && \
#    tar -xf gsa.tar.gz -C /

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

#COPY --from=isaudits/gvm:build /install/gvmd/ /install/gsa/ /usr/local/
COPY --from=isaudits/gvm:build /install/gvmd/ /usr/local/

COPY root/ /


