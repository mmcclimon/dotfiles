## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-R"
export EDITOR=vim
export MANLESS=''
export MANWIDTH=80

## misc environment vars
export TEXMFHOME="$HOME/.texmf"

# play nice with tmux
if [[ -n "$TMUX" ]]; then
    export DISABLE_AUTO_TITLE=true
fi

export LC_CTYPE=$LANG
export VIRTUAL_ENV_DISABLE_PROMPT=true

hr() { printf '-%.0s' $(seq $COLUMNS) }
