#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

create_link "$dotpath/lib" "$HOME/.config/direnv/lib"
