#!/bin/bash

# Borrowed from https://github.com/Secure-Compliance-Solutions-LLC/GVM-Docker/blob/master/install-pkgs.sh

#libmicrohttpd-dev
#libgcrypt20
#libgpgme11
#libgpgme-dev
#libhiredis-dev
#libssh-gcrypt-dev
#libxml2
#uuid

apt-get update && apt-get upgrade -y

{ cat <<EOF
gnutls-bin
libglib2.0
libgnutls28-dev
libical2-dev
nsis
postgresql-$PG_MAJOR
rsync
texlive-fonts-recommended
texlive-latex-extra
xml-twig-tools
xsltproc
EOF
} | xargs apt-get install -yq --no-install-recommends

apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
