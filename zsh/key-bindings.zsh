# Use vim cli mode, but with reasonable insert-mode shortcuts
bindkey -v
bindkey '^p' up-history
bindkey '^n' down-history

bindkey -a 'e' up-line-or-history
bindkey -a 'n' down-line-or-history

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^z' undo
bindkey '^k' kill-line

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^d' delete-char

bindkey '^b' backward-char

bindkey '^r' history-incremental-search-backward

bindkey '^t' gosmacs-transpose-chars

# fzf
if [[ -f /opt/local/share/fzf/shell/key-bindings.zsh ]]; then
  source /opt/local/share/fzf/shell/key-bindings.zsh
fi
