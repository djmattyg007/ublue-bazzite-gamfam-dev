#!/bin/bash

set -exuo pipefail

# renovate: datasource=github-releases depName=cargo-bins/cargo-binstall
CARGO_BINSTALL_VERSION="v1.19.1"
curl -fsSL "https://github.com/cargo-bins/cargo-binstall/releases/download/${CARGO_BINSTALL_VERSION}/cargo-binstall-x86_64-unknown-linux-gnu.tgz" | tar xz -C /usr/bin cargo-binstall
