#!/usr/bin/env sh

set -eu

export DOTFILES="${DOTFILES:-"$HOME/.dotfiles"}"

operating_system="$(uname -s)"

if [ "$operating_system" = "Darwin" ]; then

  if sudo xcode-select --install; then
    echo "Please install XCode or command line tools first."
    exit 1
  fi

  if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  "$DOTFILES/install-brew-path.zsh" $@

  [ -d "/opt/homebrew" ] && HOMEBREW_PREFIX="/opt/homebrew" || HOMEBREW_PREFIX="/usr/local"
  eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

  "$DOTFILES/run-before-scripts.zsh" $@
  "$DOTFILES/install-brew.zsh" $@
  "$DOTFILES/install-symlinks.zsh" $@
  "$DOTFILES/run-after-scripts.zsh" $@

elif [ "$operating_system" = "Linux" ]; then

  for requirement in zsh stow; do
    if ! [ -x "$(command -v $requirement)" ]; then
      echo "Requirement \"$requirement\" is not installed. Please install \"$requirement\" first."
      exit 1
    fi
  done

  "$DOTFILES/run-before-scripts.zsh" $@
  "$DOTFILES/install-symlinks.zsh" $@
  "$DOTFILES/run-after-scripts.zsh" $@
else

  echo "Unsupported Operating System: $operating_system"
  exit 1

fi
