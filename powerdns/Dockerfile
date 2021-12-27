FROM alpine:3.15

LABEL org.opencontainers.image.source = "https://github.com/solarnz/docker-powerdns"

ARG BACKEND

RUN apk add --no-cache \
    pdns \
    pdns-backend-$BACKEND \
    py3-pip \
    python3

RUN pip3 install --no-cache-dir envtpl

RUN mkdir -p /etc/pdns/api.d \
  && chown -R pdns: /etc/pdns/api.d \
  && mkdir -p /var/run/pdns \
  && chown -R pdns: /var/run/pdns \
  && mkdir -p /etc/pdns/pdns.d

ENV VERSION=4.4 \
  PDNS_setuid=pdns \
  PDNS_setgid=pdns \
  PDNS_daemon=no \
  PDNS_launch=$BACKEND \
  PDNS_include_dir=/etc/pdns/pdns.d

EXPOSE 53 53/udp

COPY pdns.conf.tpl /
COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/usr/sbin/pdns_server" ]
