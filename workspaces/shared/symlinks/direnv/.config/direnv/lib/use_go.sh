use_go() {
  version=$1

  if [[ -z "$version" ]]; then
    echo "Usage: use_go [VERSION]"
    return 1
  fi

  version=${version#"go"}

  version=$(semver_search "$HOME/sdk" "go" "$version")

  if [[ ! -e "$GOBIN/go${version}" || ! -e "$HOME/sdk/go${version}" ]]; then
    echo "Go ${version} is not installed."
    echo "Please run: install_go_sdk ${version}"
    return 1
  fi

  export PATH="$HOME/sdk/go${version}/bin:$PATH"
}
