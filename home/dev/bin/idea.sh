#! /bin/sh
export D="host.docker.internal:0"
xhost +
docker-compose -f ~/dev/bin/docker-compose.yml up

