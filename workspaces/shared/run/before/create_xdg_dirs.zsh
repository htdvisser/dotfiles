#!/usr/bin/env zsh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

XDG_DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}

if [[ "$(uname -s)" = "Darwin" ]]; then
  XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/Library/Caches"}
else
  XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/.cache"}
fi

if [[ ! -d "$XDG_DATA_HOME" ]]; then
  mkdir -p "$XDG_DATA_HOME"
fi

if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  mkdir -p "$XDG_CONFIG_HOME"
fi

if [[ ! -d "$XDG_CACHE_HOME" ]]; then
  mkdir -p "$XDG_CACHE_HOME"
fi
