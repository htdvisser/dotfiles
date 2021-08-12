#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if [ -e "$dotpath/completion.zsh" ]; then
  success "docker completion already installed"
else
  info "downloading docker completion"
  curl -sSL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o "$dotpath/completion.zsh"
fi
