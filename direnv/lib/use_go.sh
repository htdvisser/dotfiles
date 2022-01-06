use_go() {
  go_binary="$HOME/go/bin/go$1"
  if [[ ! -e "$go_binary" ]]; then
    echo "Installing go$1..."
    go install "golang.org/dl/go$1@latest"
  fi
  go_sdk="$HOME/sdk/go$1"
  if [[ ! -e "$go_sdk" ]]; then
    echo "Downloading go$1 SDK..."
    $go_binary download
  fi
  export GOROOT="$($go_binary env GOROOT)"
  PATH_add "$GOROOT/bin"
}
