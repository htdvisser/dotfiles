if [ "$(uname -s)" = "Linux" ]; then
  if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi
