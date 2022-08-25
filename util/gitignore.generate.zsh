#!/usr/bin/env zsh

ignore_files=(
  Go.gitignore
  Global/macOS.gitignore
  Global/Linux.gitignore
  Node.gitignore
  Global/VisualStudioCode.gitignore
)

DOTFILES=${DOTFILES:-$HOME/.dotfiles}
gitignore_file="$DOTFILES/workspaces/shared/symlinks/git/dot-gitignore"

cat > $gitignore_file <<EOF
# Generated by gitignore.generate.sh
# ----------------------------------

EOF

for ignore_file in $ignore_files
do

cat >> $gitignore_file <<EOF

# --- $ignore_file ---

EOF

curl -sSL https://github.com/github/gitignore/raw/main/$ignore_file >> $gitignore_file

done

cat >> $gitignore_file <<EOF

# --- Other ---

.envrc
tmp/
temp/
EOF