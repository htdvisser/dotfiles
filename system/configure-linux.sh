#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

info "Configuring Linux system..."

# TODO: configure stuff.

success "Configured Linux system"
