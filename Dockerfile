FROM eclipse-temurin:21-jdk-alpine

ARG PAPERMC_VERSION=1.21.7
ARG PAPERMC_BUILD=32

EXPOSE 8080
EXPOSE 19132/udp
EXPOSE 19133/udp
EXPOSE 24454/udp
EXPOSE 25565/tcp
EXPOSE 25565/udp

VOLUME ["/srv/papermc/worlds"]

WORKDIR /srv/papermc

RUN apk add --no-cache bash screen curl

COPY plugins/ plugins/
COPY root .
COPY --chmod=0755 start.sh .

ENTRYPOINT ["bash", "./start.sh"]