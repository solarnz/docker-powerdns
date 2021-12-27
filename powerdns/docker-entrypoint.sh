#!/bin/sh

set -euo pipefail

# Configure base vars
: "${PDNS_local_port:=53}"
: "${PDNS_local_address:=0.0.0.0}"

export PDNS_local_port PDNS_local_address

config_file=/etc/pdns/pdns.conf
pdns_user=pdns

# Create config file from template
envtpl < /pdns.conf.tpl > $config_file

# Fix config file ownership
chown ${pdns_user}: $config_file

exec "$@"
