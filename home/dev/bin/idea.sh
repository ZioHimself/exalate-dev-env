#! /bin/sh
export D="host.docker.internal:0"
#export DB_IP=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres_appnetwork_1`
xhost +localhost
docker-compose -f ~/dev/bin/docker-compose.yml up

