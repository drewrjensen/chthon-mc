FROM ghcr.io/drewrjensen/paper-srv:${VERSION}

EXPOSE 8080
EXPOSE 25565

WORKDIR /srv/papermc

RUN mkdir -p /srv/papermc/config
COPY conf .
COPY plugins plugins/

# Download plugins
WORKDIR /srv/papermc/plugins
RUN wget "https://hangarcdn.papermc.io/plugins/jmp/MiniMOTD/versions/2.1.5/PAPER/minimotd-bukkit-2.1.5.jar" -O MiniMOTD.jar
RUN wget "https://github.com/plan-player-analytics/Plan/releases/download/5.6.2965/Plan-5.6-build-2965.jar" -O Plan.jar
RUN wget "https://mediafilez.forgecdn.net/files/6204/234/tectonic-fabric-1.20.1-2.4.4.jar" -O Tectonic.jar
RUN wget "https://mediafilez.forgecdn.net/files/6090/387/Terralith_1.21.x_v2.5.8.jar" -O Terralith.jar
RUN wget "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.2.1/PAPER/ViaVersion-5.2.1.jar" -O ViaVersion.jar

WORKDIR /srv/papermc
ENTRYPOINT ["bash", "./start.sh"]