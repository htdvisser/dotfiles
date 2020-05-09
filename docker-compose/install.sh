#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if [ -e "$dotpath/completion.zsh" ]; then
  success "docker-compose completion already installed"
else
  info "downloading docker-compose completion"
  curl -sSL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose -o "$dotpath/completion.zsh"
fi
