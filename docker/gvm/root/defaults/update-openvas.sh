#!/usr/bin/with-contenv bash

echo "Updating NVTs..."
#s6-setuidgid abc greenbone-nvt-sync
s6-setuidgid abc rsync --compress-level=9 --links --times --omit-dir-times --recursive --partial --quiet rsync://feed.community.greenbone.net:/nvt-feed /usr/local/var/lib/openvas/plugins
sleep 5

rm /usr/local/var/run/feed-update.lock || true

echo "Updating GVMD data..."
s6-setuidgid abc greenbone-feed-sync --type GVMD_DATA
sleep 5

rm /usr/local/var/run/feed-update.lock || true

echo "Updating SCAP data..."
s6-setuidgid abc greenbone-feed-sync --type SCAP
sleep 5

rm /usr/local/var/run/feed-update.lock || true

echo "Updating CERT data..."
s6-setuidgid abc greenbone-feed-sync --type CERT
sleep 5

rm /usr/local/var/run/feed-update.lock || true
