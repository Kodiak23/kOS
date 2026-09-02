#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Install packages
dnf -y install \
  docker-buildx \
  docker-compose \
  firewalld \
  fish \
  git-lfs \
  man-db \
  podman-compose \
  qemu-guest-agent \
  uutils-coreutils \
  wget

# ceph-common # about 220MB to install, and I don't need this on every server? maybe. I might make a different image tag for it. Undecided
# pciutils # Don't need this on the base vm image until an image needs pci-passthrough devices

# Development-tools for homebrew, but the group of packages is large, going to see if I can do without first
# dnf group -y install development-tools
# dnf -y install procps-ng

# Enable COPR for package install then disable immediately so they don't end up enabled on the final image:
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# dnf5 -y copr disable ublue-os/staging

# Enable/Disable system unit files
# systemctl enable podman.socket
