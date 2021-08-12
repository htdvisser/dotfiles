if [ command -v gpg-connect-agent ] >/dev/null 2>&1; then
  gpg-connect-agent -q /bye
fi

if [ command -v gpg-agent ] >/dev/null 2>&1; then
  export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
fi
