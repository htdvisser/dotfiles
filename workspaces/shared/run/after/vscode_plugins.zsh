#!/usr/bin/env zsh

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

if [[ -x "$(command -v code)" && "$CODESPACES" != "true" ]]; then
  # Install extensions from `code --list-extensions`
  extensions=(
    casualjim.gotemplate
    dbaeumer.vscode-eslint
    eamodio.gitlens
    EditorConfig.EditorConfig
    esbenp.prettier-vscode
    GitHub.github-vscode-theme
    GitHub.vscode-pull-request-github
    golang.go
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    samverschueren.final-newline
    streetsidesoftware.code-spell-checker
    streetsidesoftware.code-spell-checker-dutch
    wayou.vscode-todo-highlight
    wholroyd.HCL
    zxh404.vscode-proto3
  )
  for extension in $extensions; do
    code --install-extension "$extension" || true
  done
fi
