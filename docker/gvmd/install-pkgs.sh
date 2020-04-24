#!/bin/bash

apt-get update && apt-get upgrade -y

#gvmd dependencies
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
