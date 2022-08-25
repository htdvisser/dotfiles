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
  if [[ $res != 0 ]]; then
    print -P "[%F{yellow}$res%f]"
  fi

  # Command duration
  if [[ $exec_start ]]; then
    elapsed=$(($SECONDS - $exec_start))
    elapsed_seconds=$(($elapsed % 60.0))
    elapsed_minutes=$(($elapsed / 60))
    if [[ $elapsed_seconds -gt 0.500 ]]; then
      print -Pn "[%F{cyan}"
      if [[ $elapsed_minutes -ge 1.0 ]]; then
        printf "%.0fm" ${elapsed_minutes}
        printf "%.0fs" ${elapsed_seconds}
      else
        printf "%.1fs" ${elapsed_seconds}
      fi
      print -P "%f]\a"
    fi
    unset exec_start
  fi

  # Directory
  print -P "%F{blue}%~%f "
}

add-zsh-hook precmd prompt_precmd

PROMPT='%F{242}%n%f %F{blue}%#%f '
[[ -z "$SSH_CONNECTION" ]] || PROMPT='%F{242}%n%f@%K{yellow}%F{black}%m%f%k %F{blue}%#%f '
