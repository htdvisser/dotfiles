#!/usr/bin/env zsh

set -euo pipefail

DOTFILES="${DOTFILES:-"$HOME/.dotfiles"}"

workspace="${1:-""}"
target="${TARGET:-$HOME}"

if [[ -z "$workspace" ]]; then
  echo "Workspace is not specified, only running shared before scripts."
fi

if [[ ! -d "$DOTFILES/workspaces/$workspace" ]]; then
  echo "Workspace $workspace does not exist."
fi

run_before_scripts() {
  script_dir="$DOTFILES/workspaces/$1/run/before"
  if [[ -z "$(ls "$script_dir")" ]]; then
    echo "No before scripts to run for workspace $1."
    return 0
  fi
  echo "Running before scripts for workspace $1..."
  for script in $(ls "$script_dir"); do
    "$script_dir/$script"
  done
}

run_before_scripts "shared"

if [[ ! -z "$workspace" ]]; then
  run_before_scripts "$workspace"
fi


