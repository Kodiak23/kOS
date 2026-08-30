#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Install development-tools for homebrew
dnf group -y install development-tools
dnf -y install procps-ng

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
  stow \
  uutils-coreutils \
  wget \
  ufw
# btop
# zoxide
# pciutils # Don't really need this on the base vm image without pci-passthrough devices
# fwupd-efi # Don't really need this on the base vm image

# Enable COPR for package install then disable immediately so they don't end up enabled on the final image:
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# dnf5 -y copr disable ublue-os/staging

# Enable/Disable system unit files
# systemctl enable podman.socket
