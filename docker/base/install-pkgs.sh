#!/bin/bash

apt-get update && apt-get upgrade -y

# Base OS stuff
{ cat <<EOF
bzip2
ca-certificates
cron
curl
git
iputils-ping
traceroute
net-tools
sudo
rsync
wget
ssmtp
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

# gvm-libs requirements
{ cat <<EOF
libnet-dev
EOF
} | xargs apt-get install -yq --no-install-recommends

# ospd requirements
{ cat <<EOF
gcc
python3-dev
python3-pip
python3-setuptools
python3-paramiko
python3-lxml
python3-defusedxml
EOF
} | xargs apt-get install -yq --no-install-recommends

pip3 install --upgrade pip
pip3 install ospd~=21.4.1

rm -rf /var/lib/apt/lists/*
