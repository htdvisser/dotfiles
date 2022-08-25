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

install_symlinks() {
  symlink_dir="$DOTFILES/workspaces/$1/symlinks"
  if [[ -z "$(ls "$symlink_dir")" ]]; then
    echo "No symlinks to install for workspace $1."
    return 0
  fi
  echo "Installing symlinks for workspace $1..."
  stow -d "$symlink_dir" -t "$target" --dotfiles $(ls "$symlink_dir")
}

install_symlinks "shared"

if [[ ! -z "$workspace" ]]; then
  install_symlinks "$workspace"
fi


