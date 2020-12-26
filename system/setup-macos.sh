#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

info "installing macOS system"

sudo tee /etc/paths <<EOF
/opt/homebrew/bin
/opt/homebrew/sbin
/usr/local/bin
/usr/local/sbin
/usr/bin
/usr/sbin
/bin
/sbin
EOF

sudo launchctl config user path "/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

success "installed macOS system"
