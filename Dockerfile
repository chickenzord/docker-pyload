FROM alpine:3.4

RUN apk update \
    && apk add ca-certificates wget tar curl openssl \
               python py-pip py-curl \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

ENV PYLOAD_VERSION=0.4.9
RUN wget https://github.com/pyload/pyload/archive/v${PYLOAD_VERSION}.tar.gz -O /tmp/pyload.tar.gz \
    && mkdir /app \
    && tar -xf /tmp/pyload.tar.gz -C /app --strip-components=1 \
    && rm /tmp/pyload.tar.gz

WORKDIR /app

