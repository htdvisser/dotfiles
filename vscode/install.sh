#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if [ "$(uname -s)" = "Darwin" ]; then
  code_user_dir="$HOME/Library/Application Support/Code/User"
  code_insiders_user_dir="$HOME/Library/Application Support/Code - Insiders/User"
else
  code_user_dir="$HOME/.config/Code/User"
  code_insiders_user_dir="$HOME/.config/Code - Insiders/User"
fi

if [ ! -d "$code_user_dir" ]; then
  mkdir -p "$code_user_dir"
fi
if [ ! -d "$code_insiders_user_dir" ]; then
  mkdir -p "$code_insiders_user_dir"
fi

create_link "$dotpath/settings.json" "$code_user_dir/settings.json"
create_link "$dotpath/snippets" "$code_user_dir/snippets"

create_link "$dotpath/settings.json" "$code_insiders_user_dir/settings.json"
create_link "$dotpath/snippets" "$code_insiders_user_dir/snippets"

if command_exists code; then
  # Install extensions from `code --list-extensions`
  modules="
    2gua.rainbow-brackets
    AndrsDC.base16-themes
    casualjim.gotemplate
    dbaeumer.vscode-eslint
    eamodio.gitlens
    EditorConfig.EditorConfig
    esbenp.prettier-vscode
    GitHub.github-vscode-theme
    GitHub.vscode-pull-request-github
    golang.go
    hashicorp.terraform
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    rust-lang.rust
    samverschueren.final-newline
    streetsidesoftware.code-spell-checker
    streetsidesoftware.code-spell-checker-dutch
    svelte.svelte-vscode
    wayou.vscode-todo-highlight
    zxh404.vscode-proto3
  "
  for module in $modules; do
    code --install-extension "$module" || true
  done
else
  info "code command not found. Skip installing extensions"
fi
