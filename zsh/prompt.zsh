autoload -Uz add-zsh-hook

prompt_precmd() {
  res=$?

  print -n '\e]0;'
  [[ -n $SSH_CONNECTION ]] && print -Pn '(%m) '
  print -Pn '%~'
  print -n '\a'

  print ''
  if [[ $res != 0 ]]
  then
    print -Pn "[%F{yellow}$res%f] "
  fi
  print -P "%F{blue}%~%f "
}

add-zsh-hook precmd prompt_precmd

PROMPT='%F{242}%n%f %F{blue}%#%f '
[[ -z "$SSH_CONNECTION" ]] || PROMPT='%F{242}%n%f@%K{yellow}%F{black}%m%f%k %F{blue}%#%f '
