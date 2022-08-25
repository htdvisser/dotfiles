export XDG_CONFIG_HOME="$HOME/.config"

export XDG_DATA_HOME="$HOME/.local/share"

if [[ "$(uname -s)" = "Darwin" ]]; then
  export XDG_CACHE_HOME="$HOME/Library/Caches"
else
  export XDG_CACHE_HOME="$HOME/.cache"
fi
