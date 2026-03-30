#!/bin/bash

set -exuo pipefail

# renovate: datasource=github-releases depName=djmattyg007/hr-zig
HR_VERSION="v1.1.2"
curl -fsSL "https://github.com/djmattyg007/hr-zig/releases/download/${HR_VERSION}/hr-zig_Linux_x86_64.tar.gz" | tar xz -C /usr/bin hr

# renovate: datasource=github-releases depName=cargo-bins/cargo-binstall
CARGO_BINSTALL_VERSION="v1.17.9"
curl -fsSL "https://github.com/cargo-bins/cargo-binstall/releases/download/${CARGO_BINSTALL_VERSION}/cargo-binstall-x86_64-unknown-linux-gnu.tgz" | tar xz -C /usr/bin cargo-binstall
