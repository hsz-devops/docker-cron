FROM alpine:3.8

ENV CRONTAB_ENTRY=""

RUN \
    apk add --update --no-cache bash && \
    rm -rf /var/cache/apk/*

SHELL ["/bin/bash", "-c"]

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]
