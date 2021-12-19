FROM alpine:3.15

LABEL org.opencontainers.image.source = "https://github.com/solarnz/docker-powerdns"

RUN apk add --no-cache \
    pdns-recursor \
    py3-pip \
    python3

RUN pip3 install --no-cache-dir envtpl

RUN mkdir -p /etc/pdns/api.d \
  && chown -R recursor: /etc/pdns/api.d \
  && mkdir -p /var/run/pdns-recursor \
  && chown -R recursor: /var/run/pdns-recursor \
  && mkdir -p /etc/pdns/recursor.d

ENV VERSION=4.4 \
  PDNS_setuid=recursor \
  PDNS_setgid=recursor \
  PDNS_daemon=no \
  PDNS_include_dir=/etc/pdns/recursor.d

EXPOSE 53 53/udp

COPY recursor.conf.tpl /
COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/usr/sbin/pdns_recursor" ]
