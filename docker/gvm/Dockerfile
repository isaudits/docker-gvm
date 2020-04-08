FROM isaudits/gvm:gvmd

#RUN cd /install/ && \
#    tar -xf gvm_libs.tar.gz -C / && \
#    tar -xf gvmd.tar.gz -C / && \
#    tar -xf gsa.tar.gz -C /

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

COPY --from=isaudits/gvm:build /install/gsa/ /usr/local/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers

COPY root/ /


