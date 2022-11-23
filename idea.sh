#! /bin/sh
#  -e DISPLAY=${DISPLAY} \
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
D="$IP:0"
docker run --rm \
  -e DISPLAY=${D} \
  -v ~/.Idea:/home/developer/.Idea \
  -v ~/.Idea.config:/home/developer/.config \
  -v ~/.Idea.java:/home/developer/.java \
  -v ~/.Idea.coursier:/home/developer/.coursier \
  -v ~/.Idea.ivy:/home/developer/.ivy2 \
  -v ~/.Idea.sbt:/home/developer/.sbt \
  -v ~/.Idea.maven:/home/developer/.m2 \
  -v ~/.Idea.gradle:/home/developer/.gradle \
  -v ~/.Idea.share:/home/developer/.local/share/JetBrains \
  -v ~/dev:/home/developer/dev \
  --name idea-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
ziohimself/exalate-dev-env:latest 

  #--network host \
  #-v /tmp/:/tmp/ \
