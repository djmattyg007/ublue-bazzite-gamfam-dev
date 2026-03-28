#!/bin/bash

set -exuo pipefail

# renovate: datasource=github-releases depName=djmattyg007/hr-zig
HR_VERSION="v1.1.2"
curl -fsSL "https://github.com/djmattyg007/hr-zig/releases/download/${HR_VERSION}/hr-zig_Linux_x86_64.tar.gz" | tar xz -C /usr/bin hr

# renovate: datasource=github-releases depName=regclient/regclient
REGCLIENT_VERSION="v0.11.2"
curl -fsSL -o /usr/bin/regctl "https://github.com/regclient/regclient/releases/download/${REGCLIENT_VERSION}/regctl-linux-amd64"
chmod +x /usr/bin/regctl
curl -fsSL -o /usr/bin/regsync "https://github.com/regclient/regclient/releases/download/${REGCLIENT_VERSION}/regsync-linux-amd64"
chmod +x /usr/bin/regsync
