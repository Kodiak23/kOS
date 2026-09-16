#!/bin/bash

set -ouex pipefail

# vm packages
dnf -y install \
  qemu-guest-agent

# qemu-guest-agent for running as a vm inside Proxmox
