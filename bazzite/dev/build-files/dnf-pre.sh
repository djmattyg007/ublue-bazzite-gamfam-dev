#!/bin/bash

set -exuo pipefail

# renovate: datasource=github-releases depName=djmattyg007/hr-zig
HR_VERSION="v1.1.2"
curl -fsSL "https://github.com/djmattyg007/hr-zig/releases/download/${HR_VERSION}/hr-zig_Linux_x86_64.tar.gz" | tar xz -C /usr/bin hr
