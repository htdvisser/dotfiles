function e() {
  target="${1:-$(pwd)}"
  workspace="$target/$(basename "$target").code-workspace"
  if [[ -f "$workspace" ]]; then
    target="$workspace"
  fi
  code "$target"
}
