export GOPATH="$HOME/go"

go_sdk=go1.16beta1

if command -v $go_sdk >/dev/null 2>&1; then
  export GOROOT="$($go_sdk env GOROOT)"
  export PATH="$GOROOT/bin:$PATH"
fi

unset go_sdk

export PATH="$GOPATH/bin:$PATH"
