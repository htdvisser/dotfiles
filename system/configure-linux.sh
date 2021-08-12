#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

info "configuring Linux system"

# TODO: configure stuff.

success "configured Linux system"
