#!/usr/bin/env sh

. "$DOTFILES/util.sh"

install_plugin() {
  if [ -e "$DOTFILES/zsh/plugins/$1" ]; then
    success "plugin $1 already installed"
    return
  else
    info "Installing ZSH plugin $1"
    curl -sSL "https://github.com/zsh-users/$1/archive/master.tar.gz" | tar xz -C "$DOTFILES/zsh/plugins/"
    rm -rf "$DOTFILES/zsh/plugins/$1"
    mv "$DOTFILES/zsh/plugins/$1-master" "$DOTFILES/zsh/plugins/$1"
  fi
}

install_plugin zsh-autosuggestions
install_plugin zsh-completions
install_plugin zsh-syntax-highlighting
install_plugin zsh-history-substring-search

# sudo chmod go-w $(brew --prefix)/share/zsh
