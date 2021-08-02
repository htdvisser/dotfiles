autoload -Uz add-zsh-hook

typeset -F SECONDS

prompt_preexec() {
  exec_start=$SECONDS
}

add-zsh-hook preexec prompt_preexec

prompt_precmd() {
  res=$?

  # Tab title
  print -n '\e]0;'
  [[ -n $SSH_CONNECTION ]] && print -Pn '(%m) '
  print -Pn '%~'
  print -n '\a'

  print ''

  # Exit code
  if [[ $res != 0 ]]
  then
    print -P "[%F{yellow}$res%f]"
  fi

  # Command duration
  if [[ $exec_start ]]
  then
    typeset -i elapsed
    elapsed=$(($SECONDS * 1000 - $exec_start * 1000))
    if [[ $elapsed -gt 500 ]]; then
      print -P "[%F{cyan}${elapsed}ms%f]\a"
    fi
    unset exec_start
  fi

  # Directory
  print -P "%F{blue}%~%f "
}

add-zsh-hook precmd prompt_precmd

PROMPT='%F{242}%n%f %F{blue}%#%f '
[[ -z "$SSH_CONNECTION" ]] || PROMPT='%F{242}%n%f@%K{yellow}%F{black}%m%f%k %F{blue}%#%f '
