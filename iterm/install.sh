#!/usr/bin/env sh

. "$DOTFILES/util.sh"

if [ -e "$DOTFILES/iterm/integration.zsh" ]; then
  success "iTerm integration already installed"
else
  info "Downloading iTerm integration..."
  curl -sSL https://iterm2.com/shell_integration/zsh -o "$DOTFILES/iterm/integration.zsh"
  info "Downloaded iTerm integration"
fi
