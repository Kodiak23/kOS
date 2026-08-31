#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Install development-tools for homebrew
dnf group -y install development-tools

# Install packages
dnf -y install \
  docker-buildx \
  docker-compose \
  ceph-common \
  git-lfs \
  man-db \
  podman-compose \
  procps-ng \
  qemu-guest-agent \
  uutils-coreutils \
  wget \
  ufw
# pciutils # Don't need this on the base vm image until an image needs pci-passthrough devices

# Enable COPR for package install then disable immediately so they don't end up enabled on the final image:
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# dnf5 -y copr disable ublue-os/staging

# Enable/Disable system unit files
# systemctl enable podman.socket
