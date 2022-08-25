#!/usr/bin/env zsh

ZPLUGINDIR=$HOME/.zsh/plugins

install_plugin() {
  if [[ ! -d "$ZPLUGINDIR" ]]; then
    mkdir -p "$ZPLUGINDIR"
  fi
  if [[ ! -d "$ZPLUGINDIR/$1" ]]; then
    curl -sSL "https://github.com/zsh-users/$1/archive/master.tar.gz" | tar xz -C "$ZPLUGINDIR"
    rm -rf "$ZPLUGINDIR/$1"
    mv "$ZPLUGINDIR/$1-master" "$ZPLUGINDIR/$1"
  fi
}

install_plugin zsh-autosuggestions
install_plugin zsh-completions
install_plugin zsh-syntax-highlighting
install_plugin zsh-history-substring-search

if [[ ! -d "$ZPLUGINDIR/zsh-iterm2-integration" ]]; then
  mkdir -p "$ZPLUGINDIR/zsh-iterm2-integration"
  curl -sSL https://iterm2.com/shell_integration/zsh -o "$ZPLUGINDIR/zsh-iterm2-integration/zsh-iterm2-integration.zsh"
fi
