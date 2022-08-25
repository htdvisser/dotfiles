if ! [ -x "$(command -v brew)" ]; then
  return 0
fi

brew_prefix=$(brew --prefix)

# Use GNU core utils instead of macOS core utils.
if [[ -d "$brew_prefix/opt/coreutils/libexec/gnubin" ]]; then
  export PATH="$brew_prefix/opt/coreutils/libexec/gnubin:$PATH"
fi

# Use GNU sed instead of macOS (BSD) sed.
if [[ -d "$brew_prefix/opt/gnu-sed/libexec/gnubin" ]]; then
  export PATH="$brew_prefix/opt/gnu-sed/libexec/gnubin:$PATH"
fi

# Use OpenSSL instead of macOS LibreSSL.
if [[ -d "$brew_prefix/opt/openssl/bin" ]]; then
  export PATH="$brew_prefix/opt/openssl/bin:$PATH"
fi

unset brew_prefix
