#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if command_exists docker-compose; then
  if [ -e "$dotpath/completion.zsh" ]; then
    success "docker-compose completion already installed"
  else
    info "Downloading docker-compose completion..."
    curl -sSL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose -o "$dotpath/completion.zsh"
    info "Downloaded docker-compose completion"
  fi
fi
