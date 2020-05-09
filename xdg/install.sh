#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))

. "$dotpath/path.zsh"

if [ ! -d "$XDG_DATA_HOME" ]; then mkdir -p "$XDG_DATA_HOME"; fi
if [ ! -d "$XDG_CONFIG_HOME" ]; then mkdir -p "$XDG_CONFIG_HOME"; fi
if [ ! -d "$XDG_CACHE_HOME" ]; then mkdir -p "$XDG_CACHE_HOME"; fi
