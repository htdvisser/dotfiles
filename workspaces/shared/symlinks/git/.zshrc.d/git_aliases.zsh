if [[ "$(uname -s)" = "Darwin" ]]; then
  alias fixup='pbpaste | xargs git commit --fixup'
fi
