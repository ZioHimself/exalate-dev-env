Docker container to run IntelliJ IDEA Ultimate Edition (https://www.jetbrains.com/idea/)

### Install on Mac
1. install docker https://docs.docker.com/get-docker/
2. install xquartz https://formulae.brew.sh/cask/xquartz
3. configure xquartz to allow network connections "Preferences > security > "Allow access from network clients"
4. configure xquartz to map option keys as alts: "Preferences > input > Option keys send Alt_L and Alt_R"
5. copy https://github.com/ZioHimself/exalate-dev-env/tree/master/home/ into ~/ 
   1. copy idea.sh from https://github.com/ZioHimself/exalate-dev-env/tree/master/home/dev/bin/idea.sh into ~/dev/bin
   2. copy docker-compose.yml from https://github.com/ZioHimself/exalate-dev-env/tree/master/home/dev/bin/docker-compose.yml  into ~/dev/bin
   3. copy settings.zip from https://github.com/ZioHimself/exalate-dev-env/tree/master/home/dev/settings.zip into ~/dev
   4. copy .Xmodmap from https://github.com/ZioHimself/exalate-dev-env/tree/master/home/.Xmodmap into ~/
   5. copy .Idea.java from https://github.com/ZioHimself/exalate-dev-env/tree/master/home/.Idea.java into ~/
6. run chmod +x ~/dev/bin/idea.sh
7. add ~/dev/bin to path: `export PATH=$PATH:${HOME}/dev/bin/`
8. run `docker pull ziohimself/exalate-dev-env:0.1.1`
9. run `docker tag ziohimself/exalate-dev-env:0.1.1 ziohimself/exalate-dev-env:latest`
10. run `idea.sh`
11. import settings.zip in your IntelliJ from [/home/developer/dev/settings.zip](home/dev/settings.zip)
12. install plugins "Scala" and ".ignore"

Docker Hub Page: https://hub.docker.com/r/ziohimself/exalate-dev-env/

### Notes

You'll still need a license to use the application!

The IDE will have access to AdoptOpenJDK 8 and to Git as well.
Project folders need to be mounted like `-v ~/Project:/home/developer/Project`.
The actual name can be anything - I used something random to be able to start multiple instances if needed.
You might want to consider using `--network=host` if you're running servers from the IDE.
