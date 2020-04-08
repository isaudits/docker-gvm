#!/usr/bin/with-contenv bash

echo "Updating NVTs..."
s6-setuidgid abc greenbone-nvt-sync
sleep 5

echo "Updating CERT data..."
s6-setuidgid abc greenbone-certdata-sync
sleep 5

echo "Updating SCAP data..."
s6-setuidgid abc greenbone-scapdata-sync