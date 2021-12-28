# docker-powerdns

Docker images for powerdns. Both the recusror and authorative images are built.

## powerdns
Built for `amd64`, `arm64` and `arm/v7`.

Multiple different versions are built, one for each different backend.
Backends available:
- bind
- ldap
- lua2
- mariadb
- mysql
- odbc
- pgsql
- pipe
- random
- remote
- sqlite3

```
docker pull ghcr.io/solarnz/powerdns:<BACKEND>
```

The default configation file supplied will load any configuration files under `/etc/pdns/pdns.d`. The intention is for you to mount a volume and add configuration files under there.

## powerdns-recursor
Built for `amd64`, `arm64` and `arm/v7`.

```
docker pull ghcr.io/solarnz/powerdns-recursor:latest
```

The default configation file supplied will load any configuration files under `/etc/pdns/recursor.d`. The intention is for you to mount a volume and add configuration files under there.
