FROM eclipse-temurin:21-jdk-alpine

ARG PAPERMC_VERSION
ARG PAPERMC_BUILD

ENV PAPERMC_VERSION=${PAPERMC_VERSION:-1.21.7}
ENV PAPERMC_BUILD=${PAPERMC_BUILD:-32}

EXPOSE 8080
EXPOSE 19132/udp
EXPOSE 19133/udp
EXPOSE 24454/udp
EXPOSE 25565/tcp
EXPOSE 25565/udp

VOLUME ["/srv/papermc/worlds"]

WORKDIR /srv/papermc

RUN apk add --no-cache bash screen curl
RUN curl -o paper-${PAPERMC_VERSION}-${PAPERMC_BUILD}.jar \
  https://api.papermc.io/v2/projects/paper/versions/${PAPERMC_VERSION}/builds/${PAPERMC_BUILD}/downloads/paper-${PAPERMC_VERSION}-${PAPERMC_BUILD}.jar
RUN ls -lh /srv/papermc && du -h paper-*.jar || echo "Jar not downloaded"

COPY plugins/ plugins/
COPY root .
COPY --chmod=0755 start.sh .

ENTRYPOINT ["bash", "./start.sh"]