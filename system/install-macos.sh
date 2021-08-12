#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

info "Installing macOS system..."

if ! command_exists brew; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  info "Installed Homebrew"
fi

architecture=$(uname -p)

if [ "$architecture" = "arm64" ]; then

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

packages="bash zsh direnv curl wget git vim htop jq"

info "Installing with brew: $packages"
brew install $packages

success "Installed macOS system"
