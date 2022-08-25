if [[ ! -z "$GOPRIVATE" ]]; then
  GOPRIVATE="$GOPRIVATE,"
fi

export GOPRIVATE="${GOPRIVATE}htdvisser.dev/*,go.htdvisser.nl/*,github.com/htdvisser/*"
