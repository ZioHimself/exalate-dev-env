#! /bin/sh
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
export D="$IP:0"
#/Applications/Utilities/XQuartz.app/Contents/MacOS/X11.sh
xhost +$IP
docker-compose -f ~/dev/bin/docker-compose.yml up

