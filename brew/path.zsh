if [ "$(uname -s)" = "Linux" ]; then
  if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi

if command -v brew >/dev/null 2>&1; then
  brew_prefix=$(brew --prefix)

  # Use GNU core utils instead of macOS core utils.
  [[ -d "$brew_prefix/opt/coreutils/libexec/gnubin" ]] && export PATH="$brew_prefix/opt/coreutils/libexec/gnubin:$PATH"

  # Use GNU sed instead of macOS (BSD) sed.
  [[ -d "$brew_prefix/opt/gnu-sed/libexec/gnubin" ]] && export PATH="$brew_prefix/opt/gnu-sed/libexec/gnubin:$PATH"

  # Use OpenSSL instead of macOS LibreSSL.
  [[ -d "$brew_prefix/opt/openssl/bin" ]] && export PATH="$brew_prefix/opt/openssl/bin:$PATH"

  unset brew_prefix
fi
