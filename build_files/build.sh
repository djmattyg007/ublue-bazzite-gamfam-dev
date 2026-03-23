#!/bin/bash

set -exuo pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# /usr/local/share/bash-completion/completions

dnf5 -y copr enable atim/starship
dnf5 -y copr enable jdxcode/mise

dnf5 -y install \
  atool \
  atuin \
  bat \
  cascadia-code-nf-fonts \
  cascadia-mono-nf-fonts \
  dfc \
  fd-find \
  git-delta \
  gitk \
  gh \
  hadolint \
  htop \
  jq \
  lsd \
  micro \
  miller \
  mise \
  nerd-fonts \
  pandoc \
  qv4l2 \
  ripgrep \
  sad \
  starship \
  shellcheck \
  tmux \
  ugrep \
  uxplay \
  vim-nerdtree

# renovate: datasource=github-releases depName=djmattyg007/hr-zig
HR_VERSION="v1.1.2"
RUN curl -fsSL "https://github.com/djmattyg007/hr-zig/releases/download/${HR_VERSION}/hr-zig_Linux_x86_64.tar.gz" | tar xz -C /usr/local/bin hr

# renovate: datasource=github-releases depName=regclient/regclient
REGCLIENT_VERSION="v0.11.2"
RUN curl -fsSL -o /usr/local/bin/regctl "https://github.com/regclient/regclient/releases/download/${REGCLIENT_VERSION}/regctl-linux-amd64"
RUN curl -fsSL -o /usr/local/bin/regctl "https://github.com/regclient/regclient/releases/download/${REGCLIENT_VERSION}/regsync-linux-amd64"

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
