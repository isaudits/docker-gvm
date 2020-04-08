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

# Base OS stuff
{ cat <<EOF
bzip2
ca-certificates
cron
curl
git
iputils-ping
net-tools
sudo
rsync
wget
EOF
} | xargs apt-get install -yq --no-install-recommends

# gvm-libs requirements
{ cat <<EOF
gnutls-bin
libgcrypt20
libglib2.0
libgnutls28-dev
libgpgme11
libgpgme-dev
libhiredis-dev
libldap2-dev
libradcli-dev
libssh-gcrypt-dev
libxml2
uuid
EOF
} | xargs apt-get install -yq --no-install-recommends

rm -rf /var/lib/apt/lists/*
