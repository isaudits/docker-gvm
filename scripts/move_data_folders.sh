#!/bin/bash

mkdir -p ../data/gvm/var/lib/gvm
mkdir -p ../data/gvm/var/lib/openvas

mv ../data/cert-data ../data/gvm/var/lib/gvm
mv ../data/scap-data ../data/gvm/var/lib/gvm
mv ../data/certificates/private ../data/gvm/var/lib/gvm
mv ../data/certificates/CA ../data/gvm/var/lib/gvm
mv ../data/certificates/gnupg ../data/gvm/var/lib/gvm/gvmd
mv ../data/plugins ../data/gvm/var/lib/openvas
