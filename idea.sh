#! /bin/sh
export D="host.docker.internal:0"
xhost +localhost
docker-compose -f ~/dev/bin/docker-compose.yml up

