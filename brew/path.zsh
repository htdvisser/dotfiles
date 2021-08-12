if [ "$(uname -s)" = "Linux" ]; then
  if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi

if command -v brew >/dev/null 2>&1; then
  brew_prefix=$(brew --prefix)

  # Use GNU core utils instead of macOS core utils.
  if [ -d "$brew_prefix/opt/coreutils/libexec/gnubin" ]; then
    export PATH="$brew_prefix/opt/coreutils/libexec/gnubin:$PATH"
  fi

  # Use GNU sed instead of macOS (BSD) sed.
  if [ -d "$brew_prefix/opt/gnu-sed/libexec/gnubin" ]; then
    export PATH="$brew_prefix/opt/gnu-sed/libexec/gnubin:$PATH"
  fi

  # Use OpenSSL instead of macOS LibreSSL.
  if [ -d "$brew_prefix/opt/openssl/bin" ]; then
    export PATH="$brew_prefix/opt/openssl/bin:$PATH"
  fi

  unset brew_prefix
fi
