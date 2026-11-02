#!/bin/bash

set -exuo pipefail

# renovate: datasource=github-releases depName=Zagrios/bs-manager
BSMANAGER_VERSION="v1.6.0"
curl -fsSL "https://github.com/Zagrios/bs-manager/releases/download/${BSMANAGER_VERSION}/bs-manager-${BSMANAGER_VERSION#v}.x86_64.rpm" -o /tmp/bs-manager.rpm
dnf5 -y install /tmp/bs-manager.rpm
rm /tmp/bs-manager.rpm
