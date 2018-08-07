FROM alpine:3.8

# https://github.com/dkruger/docker-cron

ENV CRONTAB_ENTRY=""
ENV TIME_ZONE="UTC"
ENV TIME_SERVER=""

RUN \
    apk add --update --no-cache \
        bash \
        tzdata \
    && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh

SHELL ["/bin/bash", "-c"]

ENTRYPOINT ["bash", "/entrypoint.sh"]
