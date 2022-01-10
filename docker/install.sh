#!/usr/bin/env sh

. "$DOTFILES/util.sh"

if command_exists docker; then
  if [ -e "$DOTFILES/docker/completion.zsh" ]; then
    success "docker completion already installed"
  else
    info "Downloading docker completion..."
    curl -sSL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o "$DOTFILES/docker/completion.zsh"
    info "Downloaded docker completion"
  fi
fi
