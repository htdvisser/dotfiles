if [[ $(command -v gpg) ]] && [[ $(gpg --card-status) ]] > /dev/null 2>&1; then
  gpg-connect-agent -q /bye
  export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
elif [[ $(command -v ykman) ]] && [[ ! -z "$(ykman list)" ]] && [[ -e "$(brew --prefix)/var/run/yubikey-agent.sock" ]]; then
  export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"
elif [[ -e "$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh" ]]; then
  export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"
elif [[ -e "$HOME/.sekey/ssh-agent.ssh" ]]; then
  export SSH_AUTH_SOCK="$HOME/.sekey/ssh-agent.ssh"
fi
