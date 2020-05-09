# Use GNU core utils instead of macOS core utils.
[[ -d /usr/local/opt/coreutils/libexec/gnubin ]] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Use GNU sed instead of macOS (BSD) sed.
[[ -d /usr/local/opt/gnu-sed/libexec/gnubin ]] && export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Use OpenSSL instead of macOS LibreSSL.
[[ -d /usr/local/opt/openssl/bin ]] && export PATH="/usr/local/opt/openssl/bin:$PATH"
