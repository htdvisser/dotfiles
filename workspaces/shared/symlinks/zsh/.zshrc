if [[ -x /usr/libexec/path_helper ]]; then
  eval $(PATH="" /usr/libexec/path_helper -s)
fi

# Load zsh plugins

load_plugin() {
  source "$HOME/.zsh/plugins/$1/$1.zsh"
}

load_plugin zsh-autosuggestions
load_plugin zsh-syntax-highlighting
load_plugin zsh-history-substring-search
load_plugin zsh-iterm2-integration

unset load_plugin

ZSHRCD=${ZSHRCD:-"$HOME/.zshrc.d"}

# Load zsh path files

for file in $(find "$ZSHRCD" -name '*_path.zsh' | sort); do
  source "$file"
done

# Load functions

ZSHFUNCTIONSPATH=${ZSHFUNCTIONSPATH:-"$HOME/.zsh/functions"}
fpath=("$ZSHFUNCTIONSPATH" $fpath)
autoload -U "$ZSHFUNCTIONSPATH"/*(:t)
unset ZSHFUNCTIONSPATH

# Load zsh files that are not paths nor completion

for file in $(find "$ZSHRCD" -name '*.zsh' -not -name '*_path.zsh' -not -name '*_completion.zsh' | sort); do
  source "$file"
done

# Configure completion

autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
completion_updated_at=$(date +'%j' -r ~/.zcompdump 2> /dev/null)
if [[ $(date +'%j') != "$completion_updated_at" ]]; then
  compinit
else
  compinit -C
fi
unset completion_updated_at

# Load zsh completion

for file in $(find "$ZSHRCD" -name '*_completion.zsh' | sort); do
  source "$file"
done

# Load local configuration

if [[ -f "$HOME/.localrc" ]]; then
  source "$HOME/.localrc"
fi
