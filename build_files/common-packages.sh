#!/bin/bash

set -ouex pipefail

# common packages
dnf -y install \
	gum \
	man-db \
	wget

# gum will be used for scripting
# man-db and wget are base packages I think should have been included in FCOS
