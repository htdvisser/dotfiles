if [[ -z "$GOPATH" ]]; then
  export GOPATH="$HOME/go"
fi

export GOBIN="$HOME/go/bin"

export PATH="$GOBIN:$PATH"
