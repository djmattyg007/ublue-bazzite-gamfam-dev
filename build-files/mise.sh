#!/bin/bash

set -exuo pipefail

export MISE_EXPERIMENTAL=true
export MISE_CACHE_DIR=/var/cache/mise/cache
export MISE_STATE_DIR=/tmp/mise/state
export MISE_TRUSTED_CONFIG_PATHS=/usr/share
mkdir -p /tmp/mise /var/cache/mise/{cache,data}

MISE_DATA_DIR=/var/cache/mise/data mise install --verbose --cd /usr/share --system

MISE_DATA_DIR=/usr/share/mise mise reshim
