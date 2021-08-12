#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

install_plugin() {
  if [ -e "$dotpath/plugins/$1" ]; then
    success "plugin $1 already installed"
    return
  else
    info "Installing ZSH plugin $1"
    curl -sSL "https://github.com/zsh-users/$1/archive/master.tar.gz" | tar xz -C "$dotpath/plugins/"
    rm -rf "$dotpath/plugins/$1"
    mv "$dotpath/plugins/$1-master" "$dotpath/plugins/$1"
  fi
}

install_plugin zsh-autosuggestions
install_plugin zsh-completions
install_plugin zsh-syntax-highlighting
install_plugin zsh-history-substring-search

# sudo chmod go-w /usr/local/share/zsh
