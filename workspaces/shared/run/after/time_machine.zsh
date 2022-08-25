#!/usr/bin/env zsh

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

tm_exclude() {
  if [[ ! -d "$1" ]]; then
    mkdir -p "$1"
  fi
  if [[ "$(tmutil isexcluded "$1" | grep -oE '\[Excluded\]')" = '[Excluded]' ]]; then
    return
  fi
  echo "Excluding $1 from Time Machine"
  sudo tmutil addexclusion -p "$1"
}

tm_exclude "/Applications"
tm_exclude "/Library"
tm_exclude "/Library/Application Support"
tm_exclude "/Library/Audio"
tm_exclude "/Library/Caches"
tm_exclude "/Library/Developer"
tm_exclude "/Library/Java"
tm_exclude "/Library/Logs"
tm_exclude "/Library/Updates"
tm_exclude "/opt"
tm_exclude "/private"
tm_exclude "/System"
tm_exclude "/System/Applications"
tm_exclude "/System/Library"
tm_exclude "/usr"
tm_exclude "/usr/local"
tm_exclude "$HOME/.cache"
tm_exclude "$HOME/.cargo"
tm_exclude "$HOME/.rustup"
tm_exclude "$HOME/.Trash"
tm_exclude "$HOME/.vscode-insiders"
tm_exclude "$HOME/.vscode"
tm_exclude "$HOME/Applications"
tm_exclude "$HOME/bin"
tm_exclude "$HOME/Downloads"
tm_exclude "$HOME/go/bin"
tm_exclude "$HOME/go/pkg"
tm_exclude "$HOME/Library/Application Support/Caches"
tm_exclude "$HOME/Library/Application Support/Code - Insiders"
tm_exclude "$HOME/Library/Application Support/Code"
tm_exclude "$HOME/Library/Application Support/Firefox"
tm_exclude "$HOME/Library/Application Support/Google"
tm_exclude "$HOME/Library/Application Support/Slack"
tm_exclude "$HOME/Library/Application Support/Spotify"
tm_exclude "$HOME/Library/Application Support/Syncthing"
tm_exclude "$HOME/Library/Caches"
tm_exclude "$HOME/Library/Containers"
tm_exclude "$HOME/Library/Developer"
tm_exclude "$HOME/Library/Fonts"
tm_exclude "$HOME/Library/Logs"
tm_exclude "$HOME/sdk"
tm_exclude "$HOME/Sync"
tm_exclude "$HOME/tmp"
