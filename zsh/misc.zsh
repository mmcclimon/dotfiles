## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-RF"
export EDITOR=vim
export MANLESS=''
export MANWIDTH=80

# play nice with tmux
if [[ -n "$TMUX" ]]; then
    export DISABLE_AUTO_TITLE=true
fi

export VIM="/usr/local/vimscript/runtime"

export LC_CTYPE=$LANG
export VIRTUAL_ENV_DISABLE_PROMPT=true

hr() { printf '-%.0s' $(seq $COLUMNS) }
