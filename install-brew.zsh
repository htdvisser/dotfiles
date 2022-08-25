#!/usr/bin/env zsh

set -euo pipefail

DOTFILES="${DOTFILES:-"$HOME/.dotfiles"}"

workspace="${1:-""}"
target="${TARGET:-$HOME}"

if [[ -z "$workspace" ]]; then
  echo "Workspace is not specified, only installing shared things."
fi

if [[ ! -d "$DOTFILES/workspaces/$workspace" ]]; then
  echo "Workspace $workspace does not exist."
fi

install_brewfile() {
  brewfile="$DOTFILES/workspaces/$1/Brewfile"
  if [[ ! -f "$brewfile" ]]; then
    echo "No Brewfile to install for workspace $1."
    return 0
  fi
  echo "Installing Brewfile for workspace $1..."
  brew bundle --file "$brewfile"
}

install_brewfile "shared"

if [[ ! -z "$workspace" ]]; then
  install_brewfile "$workspace"
fi


