#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# install packages for homebrew
dnf group -y install development-tools
dnf -y install procps-ng curl file

# install packages
dnf -y install \
  bootc \
  docker-buildx \
  docker-compose \
  podman \
  podman-compose \
  qemu-guest-agent \
  tmux \
  man-db \
  pciutils \
  ufw
# firewalld
# fwupd-efi
# open-vm-tools
# pv

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket
