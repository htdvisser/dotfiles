#!/usr/bin/env zsh

DOTFILES=${DOTFILES:-$HOME/.dotfiles}

for workspace in $(ls "$DOTFILES/workspaces"); do
  find "$DOTFILES/workspaces/$workspace/run" -type f -name '*.zsh' | while read f; do chmod 755 $f; done
  find "$DOTFILES/workspaces/$workspace/symlinks" -type f -name '*.zsh' | while read f; do chmod 644 $f; done
done

find "$DOTFILES" -type f -name '*.zsh' -or -name '*.sh' -maxdepth 1 | while read f; do chmod 755 $f; done
find "$DOTFILES/util" -type f -name '*.zsh' -or -name '*.sh' -maxdepth 1 | while read f; do chmod 755 $f; done
