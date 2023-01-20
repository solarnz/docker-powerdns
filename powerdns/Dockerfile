FROM alpine:3.17

LABEL org.opencontainers.image.source = "https://github.com/solarnz/docker-powerdns"

ARG BACKEND

RUN set -euxo pipefail; \
    apk update; \
    apk add pdns; \
    if [ $BACKEND == all ]; then \
        apk add $(apk search -qe "pdns-backend-*"); \
    else \
        apk add pdns-backend-$BACKEND; \
    fi; \
    rm -rf /var/cache/apk/

RUN mkdir -p /etc/pdns/api.d \
  && chown -R pdns: /etc/pdns/api.d \
  && mkdir -p /var/run/pdns \
  && chown -R pdns: /var/run/pdns \
  && mkdir -p /etc/pdns/pdns.d

RUN set -euxo pipefail; \
    if [ $BACKEND == all ]; then \
        echo launch=bind > /etc/pdns/pdns.d/00-default.conf; \
    else \
        echo launch=$BACKEND > /etc/pdns/pdns.d/00-default.conf; \
    fi

EXPOSE 53 53/udp

COPY pdns.conf /etc/pdns/pdns.conf

CMD [ "/usr/sbin/pdns_server" ]
