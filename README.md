# docker-gvm
Docker implementation of Greenbone Vulnerability Management (GVM) / OpenVAS

## Source repo
<https://github.com/isaudits/docker-gvm>

## Run notes
The easiest way to run is using docker-compose. An example compose file can be
found in the github repo at <https://github.com/isaudits/docker-gvm/blob/master/docker-compose.yml>.

The sample compose file references an .env file for defining environment variables
at config/local.env; a sample .env file can also be found in the github repo.

## Version / upgrade notes
### 20.8
When upgrading from GVM 11, the system has to migrate default reports from those included
with source of GVM 11 (/usr/local/share/gvm/gvmd/report_formats/) to the new feed based
reports. This process fails if the directory is empty (which is the case when this directory
lives inside a docker image for version 11). Solution was to populate this directory inside
the image from our GVM11 base image

Default path for ospd socket has changed from /tmp/ospd.sock to /var/run/ospd/ospd.sock;
This path has to be changed in the ospd.conf file. Solution was to implement commands
on startup to set default values in ospd.conf

Have to manually change scanner pid path on existing scanner if upgraded from GVM 11;
on portainer, use command shell as user abc:
```
gvmd --get-scanners
gvmd --modify-scanner=<UUID> --scanner-host=/var/run/ospd/ospd.sock
```

## Environment variables
The following environment variables can be defined in your docker-compose file or
the referenced .env file, or can be passed into docker command line:


- UPDATE_ON_START - run feed update script on launch
- PUID - PID of non-root user (1000)
- PGID - GID of non-root user (100)
- TZ - Time Zone (America/New_York)
- GVM_USER - username of default GVM user (admin)
- GVM_PASSWORD - password for default GVM user (admin - can be changed in GSA later)
- GSA_TIMEOUT - HTTP timeout for GSA (600)
- SMTP_HOST - SMTP relay for emailing reports
- SMTP_PORT - SMTP relay port
- SMTP_MASQ - SMTP masquerade domain

--------------------------------------------------------------------------------

Copyright 2020

Matthew C. Jones, CPA, CISA, OSCP, CCFE

IS Audits & Consulting, LLC - <http://www.isaudits.com/>

TJS Deemer Dana LLP - <http://www.tjsdd.com/>

--------------------------------------------------------------------------------

Except as otherwise specified:

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.