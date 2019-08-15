HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1100000

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
