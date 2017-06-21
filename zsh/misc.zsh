## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

setopt correct

## pager
export PAGER="less"
export LESS="-R"
export EDITOR=vim
export MANLESS=''
export MANWIDTH=80
export MANPAGER='col -b | view -c "set ft=man" -'

function perldoc() {
    cpandoc -opod $@ | view -c "set ft=pod" -
}

## misc environment vars
export TEXMFHOME="$HOME/.texmf"
export GCAL="-s 1"

# play nice with tmux
if [[ -n "$TMUX" ]]; then
    export DISABLE_AUTO_TITLE=true
fi

export LC_CTYPE=$LANG
export VIRTUAL_ENV_DISABLE_PROMPT=true

hr() { printf '-%.0s' $(seq $COLUMNS) }
