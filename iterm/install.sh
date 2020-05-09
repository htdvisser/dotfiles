#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if [ -e "$dotpath/integration.zsh" ]; then
  success "iTerm integration already installed"
else
  info "downloading iTerm integration"
  curl -sSL https://iterm2.com/shell_integration/zsh -o "$dotpath/integration.zsh"
fi
