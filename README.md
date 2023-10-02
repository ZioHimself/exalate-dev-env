Docker container to run IntelliJ IDEA Ultimate Edition (https://www.jetbrains.com/idea/)

### Install on Mac
1. install [docker](https://docs.docker.com/get-docker/)
2. install [xquartz](https://formulae.brew.sh/cask/xquartz)
3. start xquartz
4. configure xquartz to allow network connections Preferences > security > "Allow access from network clients"
5. configure xquartz to map option keys as alts: Preferences > input > "Option keys send Alt_L and Alt_R"
6. restart xquartz
7. confirm that xquartz is working by running `export DISPLAY=":0"; xeyes` (it's expected that a new window showing eyes startsup)
8. close the eyes program
9. download the repository
      1. as a zip:
            1. `https://github.com/ZioHimself/exalate-dev-env/archive/refs/heads/master.zip`
            2. unzip the repository zip
      3. or as a git repo:
            1. create folder
            2. `git init`
            3. `git remote add origin git@github.com:ZioHimself/exalate-dev-env.git`
      
12. copy [home](home) into ~/ : `cp -r exalate-dev-env/home/* ~/` (covers all the sub-directories and files)
      1. copy [home/dev/bin/idea.sh](home/dev/bin/idea.sh) into ~/dev/bin
      2. copy [home/dev/bin/docker-compose.yml](home/dev/bin/docker-compose.yml) into ~/dev/bin
      3. copy [home/dev/settings.zip](home/dev/settings.zip) into ~/dev
      4. copy [home/.Xmodmap](home/.Xmodmap) into ~/
      5. copy [home/.Idea.java](home/.Idea.java) into ~/
11. run `chmod +x ~/dev/bin/idea.sh`
12. add ~/dev/bin to path: `echo "export PATH=$PATH:${HOME}/dev/bin/" >> ~/.zshrc`
13. run `docker pull ziohimself/exalate-dev-env:0.1.1`
14. run `docker tag ziohimself/exalate-dev-env:0.1.1 ziohimself/exalate-dev-env:latest`
15. restart terminal
16. start XQuartz
17. start docker
18. run `export DISPLAY=":0"`
19. run `idea.sh`
20. import settings.zip in your IntelliJ from [/home/developer/dev/settings.zip](home/dev/settings.zip)
21. install plugins ["Scala"](https://plugins.jetbrains.com/plugin/1347-scala) and [".ignore"](https://plugins.jetbrains.com/plugin/20485--ignore)

Docker Hub Page: https://hub.docker.com/r/ziohimself/exalate-dev-env/

### Notes

You'll still need a license to use the application!

The IDE will have access to AdoptOpenJDK 8 and to Git as well.
Project folders need to be mounted like `-v ~/Project:/home/developer/Project`.
The actual name can be anything - I used something random to be able to start multiple instances if needed.
You might want to consider using `--network=host` if you're running servers from the IDE.
