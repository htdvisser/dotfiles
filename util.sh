#!/usr/bin/env sh

setup_color() {
  if [ -t 1 ]; then
    RESET=$(printf '\033[m')
    BLUE=$(printf '\033[34m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    RED=$(printf '\033[31m')
  else
    RESET=""
    BLUE=""
    GREEN=""
    YELLOW=""
    RED=""
  fi
}

setup_color

info() {
  printf "\r  [ ${BLUE}INFO${RESET} ] %s\n" "$@" >&2
}

success() {
  printf "\r  [  ${GREEN}OK${RESET}  ] %s\n" "$@" >&2
}

warn() {
  printf "\r  [ ${YELLOW}WARN${RESET} ] %s\n" "$@" >&2
}

error() {
  printf "\r  [ ${YELLOW}ERR${RESET}  ] %s\n" "$@" >&2
}

fatal() {
  printf "\r  [ ${RED}FAIL${RESET} ] %s\n" "$@" >&2
  exit 1
}

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

require_command() {
  if ! command_exists "$1"; then
    fatal "$1 is not installed; please install $1 first"
  fi
}

create_link() {
  if [ -e "$2" ]; then
    if [ "$(readlink "$2")" = "$1" ]; then
      success "skip linking $1 => $2"
      return 0
    else
      mv "$2" "$2.backup"
      success "moved $2 to $2.backup"
    fi
  fi
  ln -sf "$1" "$2"
  success "linked $1 to $2"
}
