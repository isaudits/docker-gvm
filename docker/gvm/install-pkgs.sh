#!/bin/bash

apt-get update && apt-get upgrade -y

#gvmd dependencies
{ cat <<EOF
gnutls-bin
libglib2.0
libgnutls28-dev
libical-dev
nsis
postgresql-$PG_MAJOR
rsync
smbclient
sshpass
openssh-client
snmp
socat
texlive-fonts-recommended
texlive-latex-extra
xml-twig-tools
xsltproc
EOF
} | xargs apt-get install -yq --no-install-recommends

# gsa dependencies
{ cat <<EOF
gnutls-bin
libgcrypt20
libglib2.0
libgnutls28-dev
libmicrohttpd-dev
libxml2
EOF
} | xargs apt-get install -yq --no-install-recommends


# Install Node.js
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install nodejs -yq --no-install-recommends


# Install Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install yarn -yq --no-install-recommends

apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
