u=()
zstyle ':completion:*:ssh:*' users $u
h=()
if [[ -f ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -d ~/.ssh/config.d ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config.d/*)"}:#Host *}#Host }:#*[*?]*})
fi
zstyle ':completion:*:ssh:*' hosts $h
