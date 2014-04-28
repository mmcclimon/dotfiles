## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-RFX"
export EDITOR=vim
export LESS="-R"
export MANLESS=''

export TERM='xterm-256color'

export LC_CTYPE=$LANG
export VIRTUAL_ENV_DISABLE_PROMPT=true

hr() { printf '-%.0s' $(seq $COLUMNS) }
