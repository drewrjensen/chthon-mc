# chthon-mc

- build: `docker build -t drewrjensen/chthon-mc:$VERSION .`
-   run: `docker run --init -p 8080:8080 -p 19132:19132 -p 24454:24454 -p 25565:25565 -v paper-plugins-vol:/srv/papermc/plugins -v paper-worlds-vol:/srv/papermc/worlds drewrjensen/paper-srv -d`