#!/bin/bash

# Borrowed from https://github.com/Secure-Compliance-Solutions-LLC/GVM-Docker/blob/master/install-pkgs.sh

# Not sure about these!
# geoip-database
# graphviz
# heimdal-dev
# libpopt-dev
# libnet-snmp-perl
# perl-base
# whiptail


# Tools - check on these too
# ike-scan
# openssh-client
# smbclient
# wapiti

apt-get update && apt-get upgrade -y

{ cat <<EOF
bison
gcc
gnutls-bin
libgcrypt20
libglib2.0
libgnutls28-dev
libgpgme11
libgpgme-dev
libhiredis-dev
libksba-dev
libpcap-dev
libsnmp-dev
libssh-gcrypt-dev
libxml2
nmap
python3-dev
python3-pip
python3-setuptools
redis-server
redis-tools
rsync
uuid
EOF
} | xargs apt-get install -yq --no-install-recommends


#pip3 install gvm-tools
pip3 install ospd
pip3 install ospd-openvas
#pip3 install python-gvm
pip3 install impacket

apt-get remove -y gcc python3-dev
apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
