FROM alpine:3.15

LABEL org.opencontainers.image.source = "https://github.com/solarnz/docker-powerdns"

ARG BACKEND

RUN apk add --no-cache \
    pdns \
    pdns-backend-$BACKEND

RUN mkdir -p /etc/pdns/api.d \
  && chown -R pdns: /etc/pdns/api.d \
  && mkdir -p /var/run/pdns \
  && chown -R pdns: /var/run/pdns \
  && mkdir -p /etc/pdns/pdns.d

RUN echo launch=$BACKEND > /etc/pdns/pdns.d/00-default.conf

EXPOSE 53 53/udp

COPY pdns.conf /etc/pdns/pdns.conf

CMD [ "/usr/sbin/pdns_server" ]
