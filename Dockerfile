# FROM ghcr.io/drewrjensen/paper-srv:${VERSION}
FROM ghcr.io/drewrjensen/paper-srv:f54476c

EXPOSE 8080
EXPOSE 19132
EXPOSE 19133
EXPOSE 24454
EXPOSE 25565

VOLUME ["/srv/papermc/worlds"]

RUN mkdir -p /srv/papermc
WORKDIR /srv/papermc
RUN mkdir -p config
COPY conf .
RUN mkdir -p plugins
COPY plugins/ plugins/
RUN mkdir -p /srv/papermc/worlds/Chthon/datapacks
COPY datapacks/ worlds/Chthon/datapacks
COPY start.sh .
ENTRYPOINT ["bash", "./start.sh"]