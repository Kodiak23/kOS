#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

case "$TAG" in
base | latest)
  exit 0
  ;;
vm)
  /ctx/common-packages.sh
  /ctx/vm-packages.sh
  ;;
server)
  /ctx/common-packages.sh
  /ctx/server-packages.sh
  ;;
esac

# Enable/Disable system unit files
# systemctl enable podman.socket
