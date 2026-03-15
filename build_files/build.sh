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

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
