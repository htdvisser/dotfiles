if [ -z "$GOPATH" ]; then
  export GOPATH="$HOME/go"
fi

# go_sdk=go1.xx.x

# if command -v "$GOPATH/bin/$go_sdk" >/dev/null 2>&1
# then
#   export GOROOT="$("$GOPATH/bin/$go_sdk" env GOROOT)"
#   export PATH="$GOROOT/bin:$PATH"
# fi

# unset go_sdk

export PATH="$GOPATH/bin:$PATH"
