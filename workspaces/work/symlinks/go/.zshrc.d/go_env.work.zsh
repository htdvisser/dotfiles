if [[ ! -z "$GOPRIVATE" ]]; then
  GOPRIVATE="$GOPRIVATE,"
fi

export GOPRIVATE="${GOPRIVATE}gitlab.1password.io,go.1password.io,htdvisser.dev/1password"
