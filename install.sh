#!/usr/bin/env sh

BREW=${BREW:-no}
SYSTEM=${SYSTEM:-no}

allowed_shell() {
  grep "$1" /etc/shells >/dev/null 2>&1
}

find_zsh() {
  if command_exists zsh && allowed_shell "$(which zsh)"; then
    which zsh
  else
    echo "/bin/zsh"
  fi
}

change_shell() {
  if [ "$(basename "$SHELL")" = "zsh" ]; then
    info "Shell is already $SHELL"
    return
  fi

  if ! command_exists chsh; then
    warn "chsh is missing; can't change shell to zsh"
    return
  fi
  zsh=$(find_zsh)
  if ! chsh -s "$zsh"; then
    error "Failed to change shell to zsh"
    return
  fi

  export SHELL="$zsh"
  success "Changed shell to zsh"
}

install_dotfiles() {
  info 'installing dotfiles'
  find -L "$DOTFILES" -maxdepth 3 -name '*.symlink' -not -path '*.git*' |
    while read -r src; do
      dst="$HOME/.$(basename "${src%.*}")"
      create_link "$src" "$dst"
    done
}

install_others() {
  find -L "$DOTFILES" -mindepth 2 -maxdepth 3 -name 'install.sh' -not -path '*.git*' |
    while read -r installer; do
      info "running ${installer}..."
      $installer
    done
}

main() {
  export DOTFILES=$(dirname $(readlink -f "$0"))
  . "$DOTFILES/util.sh"

  if [ "$DOTFILES" != "$HOME/dotfiles" ]; then
    create_link "$DOTFILES" "$HOME/dotfiles"
    export DOTFILES="$HOME/dotfiles"
  fi

  local operating_system="$(uname -s)"

  if [ "$operating_system" = "Darwin" ]; then
    "$DOTFILES/system/install-macos.sh"
  elif [ "$operating_system" = "Linux" ]; then
    "$DOTFILES/system/install-linux.sh"
  else
    fatal "Unsupported Operating System: $operating_system"
  fi

  if [ "$operating_system" = "Darwin" ]; then
    "$DOTFILES/system/configure-macos.sh"
  elif [ "$operating_system" = "Linux" ]; then
    "$DOTFILES/system/configure-linux.sh"
  else
    fatal "Unsupported Operating System: $operating_system"
  fi

  install_dotfiles

  install_others

  change_shell

  info "all done"
}

main "$@"

exec $SHELL
