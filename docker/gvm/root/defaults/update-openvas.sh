#!/usr/bin/with-contenv bash

echo "Updating NVTs..."
#s6-setuidgid abc greenbone-nvt-sync
s6-setuidgid abc rsync --compress-level=9 --links --times --omit-dir-times --recursive --partial --quiet rsync://feed.community.greenbone.net:/nvt-feed /usr/local/var/lib/openvas/plugins
sleep 5

echo "Updating CERT data..."
s6-setuidgid abc greenbone-certdata-sync
sleep 5

echo "Updating SCAP data..."
s6-setuidgid abc greenbone-scapdata-sync