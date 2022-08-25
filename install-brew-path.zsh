#!/usr/bin/env zsh

set -euo pipefail

architecture=$(uname -p)

if [[ "$architecture" = "arm" || "$architecture" = "arm64" ]]; then

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

else

  sudo tee /etc/paths <<EOF
/usr/local/bin
/usr/local/sbin
/usr/bin
/usr/sbin
/bin
/sbin
EOF

fi
