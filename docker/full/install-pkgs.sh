#!/bin/bash

# Borrowed from https://github.com/Secure-Compliance-Solutions-LLC/GVM-Docker/blob/master/install-pkgs.sh

#python3-defusedxml
#python3-dialog
#python3-lxml
#python3-paramiko
#
#python3-polib
#python3-psutil
#postgresql-contrib

apt-get update && apt-get upgrade -y

{ cat <<EOF
gnutls-bin
libgcrypt20
libglib2.0
libgnutls28-dev
libgpgme11
libgpgme-dev
libhiredis-dev
libical2-dev
libmicrohttpd-dev
libssh-gcrypt-dev
libxml2
nsis
postgresql-$PG_MAJOR
rsync
texlive-fonts-recommended
texlive-latex-extra
uuid
xsltproc
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
