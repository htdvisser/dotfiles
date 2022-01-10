#!/usr/bin/env sh

. "$DOTFILES/util.sh"

if command_exists docker-compose; then
  if [ -e "$DOTFILES/docker-compose/completion.zsh" ]; then
    success "docker-compose completion already installed"
  else
    info "Downloading docker-compose completion..."
    curl -sSL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose -o "$DOTFILES/docker-compose/completion.zsh"
    info "Downloaded docker-compose completion"
  fi
fi
