# Base Image
FROM ghcr.io/ublue-os/bazzite:stable@sha256:c4082bc494f7071a6a4ae110cf17ece90ee04fa8ef1a8ed840e80ec2f02dfa6d

## Other possible base images include:
# FROM ghcr.io ublue-os/bazzite:latest
# FROM ghcr.io ublue-os/bluefin-nvidia:stable
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### [IM]MUTABLE /opt
## Some bootable images, like Fedora, have /opt symlinked to /var/opt, in order to
## make it mutable/writable for users. However, some packages write files to this directory,
## thus its contents might be wiped out when bootc deploys an image, making it troublesome for
## some packages. Eg, google-chrome, docker-desktop.
##
## Uncomment the following line if one desires to make /opt immutable and be able to be used
## by the package manager.

# RUN rm /opt && mkdir /opt

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN mkdir -p /usr/gamfam/build-files

COPY build-files/dnf-pre.sh /usr/gamfam/build-files/dnf-pre.sh
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /usr/gamfam/build-files/dnf-pre.sh

COPY build-files/dnf.sh /usr/gamfam/build-files/dnf.sh
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /usr/gamfam/build-files/dnf.sh

COPY build-files/mise.sh /usr/gamfam/build-files/mise.sh
ENV MISE_SYSTEM_DATA_DIR="/usr/share/mise"
RUN mkdir "${MISE_SYSTEM_DATA_DIR}"
COPY mise.toml mise.lock /usr/share/
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /usr/gamfam/build-files/mise.sh
ENV PATH="/usr/share/mise/shims:${PATH}"

COPY build-files/finish.sh /usr/gamfam/build-files/finish.sh
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /usr/gamfam/build-files/finish.sh

# testing
ENV MATTG=mattg

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
