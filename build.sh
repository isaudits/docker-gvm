#!/bin/bash

docker/hooks/build.local
docker image prune -f
docker system prune -f