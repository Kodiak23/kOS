#!/bin/bash

set -ouex pipefail

# install common packages
dnf -y install \
  man-db

# man-db is a base package I think should have been included in FCOS
