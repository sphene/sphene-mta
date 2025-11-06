FROM alpine:latest AS base

WORKDIR /app

RUN apk add --no-cache --update wget tar
RUN wget https://nightly.multitheftauto.com/multitheftauto_linux_x64-1.7.0-untested-25832.tar.gz -O /tmp/multitheftauto_binaries.tar.gz \
    && wget https://linux.mtasa.com/dl/baseconfig.tar.gz -O /tmp/multitheftauto_config.tar.gz \
    && wget https://nightly.mtasa.com/files/modules/64/libmysqlclient.so.16 -P /usr/lib \
    && tar -xzvf /tmp/multitheftauto_binaries.tar.gz \
    && mv multitheftauto_linux_x64* server \
    && tar -xzvf /tmp/multitheftauto_config.tar.gz -C server \
    && mv server/baseconfig/* server/mods/deathmatch \
    && chmod go+rw server -R \
    && chmod +x server/mta-server64 \
    && chmod +x /usr/lib/libmysqlclient.so.16
RUN rm -r /tmp

FROM debian:trixie-slim

WORKDIR /app/server

RUN apt-get update && apt-get install bash tar unzip libncursesw6 wget libstdc++6 -y

COPY --from=base /app/server .

EXPOSE 22003/udp 22005/tcp 22126/udp

ENTRYPOINT [ "./mta-server64" ]

CMD ["-x", "-n", "-u"]
