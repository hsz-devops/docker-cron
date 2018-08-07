#!/bin/sh

# https://github.com/dkruger/docker-cron
# https://github.com/bigtruedata/docker

set -ex

trap exit SIGINT
trap exit SIGTERM

# configure timezone if provided
if [ -n "$TIME_ZONE" ]; then
    cp /usr/share/zoneinfo/"$TIME_ZONE" /etc/localtime
    echo "$TIME_ZONE" > /etc/timezone
fi

# configure timeserver if not provided
if [ -z "$TIME_SERVER" ]; then
  TIME_SERVER=pool.ntp.org
fi


if test -f /entrypoint.d/*; then
    . /entrypoint.d/*
fi

cat << EOF > /var/spool/cron/crontabs/root
${CRONTAB_ENTRY}
EOF

ntpd -p "$TIME_SERVER"
crond -f -l 0

