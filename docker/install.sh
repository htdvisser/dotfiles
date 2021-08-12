#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if command_exists docker; then
  if [ -e "$dotpath/completion.zsh" ]; then
    success "docker completion already installed"
  else
    info "Downloading docker completion..."
    curl -sSL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o "$dotpath/completion.zsh"
    info "Downloaded docker completion"
  fi
fi
