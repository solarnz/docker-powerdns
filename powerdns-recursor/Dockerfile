FROM alpine:3.19

LABEL org.opencontainers.image.source = "https://github.com/solarnz/docker-powerdns"

RUN apk add --no-cache \
    pdns-recursor

RUN mkdir -p /etc/pdns/api.d \
  && chown -R recursor: /etc/pdns/api.d \
  && mkdir -p /var/run/pdns-recursor \
  && chown -R recursor: /var/run/pdns-recursor \
  && mkdir -p /etc/pdns/recursor.d

EXPOSE 53 53/udp

COPY recursor.conf /etc/pdns/

CMD [ "/usr/sbin/pdns_recursor" ]
