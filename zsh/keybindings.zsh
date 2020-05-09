bindkey -e

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey '^[[A' history-substring-search-up

bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[B' history-substring-search-down

bindkey "$terminfo[khome]" beginning-of-line
bindkey '^[[H' beginning-of-line # Home (Cmd + left arrow)
bindkey '^A' beginning-of-line   # Home (VS Code Cmd + left arrow)

bindkey "$terminfo[kend]" end-of-line
bindkey '^[[F' end-of-line # End (Cmd + right arrow)
bindkey '^E' end-of-line   # End (VS Code Cmd + right arrow)

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

bindkey '^[b' backward-word
bindkey '^[f' forward-word

bindkey $terminfo[kdch1] delete-char
