#!/bin/bash

set -ouex pipefail

if [[ $TAG == "base" ]]; then
  exit 0
fi

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files/common"/. /
# Install packages
/ctx/common-packages.sh

case "$TAG" in
vm | latest)
  cp -avf "/ctx/system_files/vm"/. /
  /ctx/vm-packages.sh
  ;;
server)
  cp -avf "/ctx/system_files/server"/. /
  /ctx/server-packages.sh
  ;;
esac

# Enable/Disable system unit files
# systemctl enable podman.socket
