FROM lsiobase/ubuntu:focal as build

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

ENV gvm_libs_version="v21.4.1" \
    openvas_scanner_version="v21.4.1" \
    gvmd_version="v21.4.2" \
    gsa_version="v21.4.1" \
    openvas_smb="v21.4.0"

RUN echo "Starting Build..." && mkdir /build && mkdir /install

FROM build as build-gvm_libs
    
RUN cd /build && \
    wget --no-verbose https://github.com/greenbone/gvm-libs/archive/$gvm_libs_version.tar.gz && \
    tar -zxf $gvm_libs_version.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd /build && \
    rm -rf *

RUN cd /install && \
    tar cvzf gvm_libs.tar.gz /usr/local/

FROM build as build-openvas_smb

RUN cd /build && \
    wget --no-verbose https://github.com/greenbone/openvas-smb/archive/$openvas_smb.tar.gz && \
    tar -zxf $openvas_smb.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd /build && \
    rm -rf *

RUN cd /install && \
    tar cvzf openvas_smb.tar.gz /usr/local/

#NOTE - requires gvm_libs as dependency
FROM build-gvm_libs as build-gvmd

RUN cd /build && \
    wget --no-verbose https://github.com/greenbone/gvmd/archive/$gvmd_version.tar.gz && \
    tar -zxf $gvmd_version.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd /build && \
    rm -rf *

RUN cd /install && \
    tar cvzf gvmd.tar.gz /usr/local/

#NOTE - requires gvm_libs as dependency
FROM build-gvm_libs as build-openvas_scanner

RUN cd /build && \
    wget --no-verbose https://github.com/greenbone/openvas-scanner/archive/$openvas_scanner_version.tar.gz && \
    tar -zxf $openvas_scanner_version.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd /build && \
    rm -rf *

RUN cd /install && \
    tar cvzf openvas_scanner.tar.gz /usr/local/

#NOTE - requires gvm_libs as dependency
FROM build-gvm_libs as build-gsa
    
RUN cd /build && \
    wget --no-verbose https://github.com/greenbone/gsa/archive/$gsa_version.tar.gz && \
    tar -zxf $gsa_version.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd /build && \
    rm -rf *

RUN cd /install && \
    tar cvzf gsa.tar.gz /usr/local/


FROM lsiobase/ubuntu:focal

#RUN mkdir /install

#COPY --from=build-gvm_libs /install/ /install/
#COPY --from=build-openvas_smb /install/ /install/
#COPY --from=build-gvmd /install/ /install/
#COPY --from=build-openvas_scanner /install/ /install/
#COPY --from=build-gsa /install/ /install/

RUN mkdir /install && \
    mkdir /install/gvm_libs && \
    mkdir /install/openvas_smb && \
    mkdir /install/gvmd && \
    mkdir /install/openvas_scanner && \
    mkdir /install/gsa

COPY --from=build-gvm_libs /usr/local/ /install/gvm_libs
COPY --from=build-openvas_smb /usr/local/ /install/openvas_smb
COPY --from=build-gvmd /usr/local/ /install/gvmd
COPY --from=build-openvas_scanner /usr/local/ /install/openvas_scanner
COPY --from=build-gsa /usr/local/ /install/gsa



