#!/bin/bash

set -oue pipefail

PACKAGES=()
CLI_ESSENTIALS=(
  "bat"
  "bbrew"
  "btop"
  "duf"
  "eza"
  "fastfetch"
  "fish"
  "fzf"
  "ncdu"
  "stow"
  "wget"
  "zellij"
  "zoxide"
)
CLI_EXTRAS=(
  "atuin"
  "fd"
  "git-lfs"
  "lazygit"
  "lazyjournal"
  "neovim"
  "podman-tui"
  "superfile"
  "tealdeer"
  "ugrep"
)
DOCKER_PACKAGES=(
  "docker-compose"
  "docker-buildx"
  "lazydocker"
)
# choose packages to install
PACKAGES+=$(gum choose --no-limit --height 15 --header "Choose cli essential packages to install with homebrew" ${CLI_ESSENTIALS[@]})
PACKAGES+=$(gum choose --no-limit --height 15 --header "Choose cli extra packages to install with homebrew" ${CLI_EXTRAS[@]})
PACKAGES+=$(gum choose --no-limit --height 15 --header "Choose docker packages to install with homebrew" ${DOCKER_PACKAGES[@]})

echo ${PACKAGES[@]}
