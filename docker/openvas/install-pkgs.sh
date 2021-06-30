#!/bin/bash

apt-get update && apt-get upgrade -y

# OpenVAS scanner requirements
{ cat <<EOF
bison
libgcrypt20
libglib2.0
libgnutls28-dev
libpcap-dev
libsnmp-dev
libssh-gcrypt-dev
nmap
python3-impacket
redis-server
redis-tools
EOF
} | xargs apt-get install -yq --no-install-recommends

#ospd-openvas requirements
{ cat <<EOF
python3-redis
python3-psutil
python3-packaging
EOF
} | xargs apt-get install -yq --no-install-recommends

pip3 install ospd-openvas~=21.4.0

apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
