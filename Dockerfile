# Build a minimal distribution container

FROM debian:stretch

RUN set -ex \
    && apt-get update && apt-get install -y  ca-certificates apache2-utils

COPY ./registry/registry /bin/registry
COPY ./registry/config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]
EXPOSE 5000

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/etc/docker/registry/config.yml"]
