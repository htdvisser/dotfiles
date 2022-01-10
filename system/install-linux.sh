#!/usr/bin/env sh

. "$DOTFILES/util.sh"

info "Installing Linux system..."

maybe_sudo=""
if command_exists sudo; then
  maybe_sudo="sudo"
fi

packages="bash zsh direnv curl wget git vim htop jq"

if command_exists apt; then
  info "Installing with apt: $packages"

  $maybe_sudo apt-get update
  $maybe_sudo apt-get -y install $packages

elif command_exists yum; then
  info "Installing with yum: $packages"

  $maybe_sudo yum install -y $packages
fi

success "Installed Linux system"
