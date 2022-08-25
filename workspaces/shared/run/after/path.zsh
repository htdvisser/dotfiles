#!/usr/bin/env zsh

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

architecture=$(uname -p)

if [[ "$architecture" = "arm" || "$architecture" = "arm64" ]]; then
  sudo launchctl config user path "/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
else
  sudo launchctl config user path "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
fi
