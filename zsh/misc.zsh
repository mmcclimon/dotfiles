## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## history
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

## colors
[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor
[ -e "$HOME/.dircolors" ] && eval `dircolors -b $HOME/.dircolors`

## pager
export PAGER="less"
export LESS="-R"
export EDITOR=vim
export MANLESS=''
export MANWIDTH=80
export MANPAGER=manpager

function perldoc() { cpandoc -otext $@ }

## misc environment vars
# export TEXMFHOME="$HOME/.texmf"

export LC_CTYPE=$LANG
export VIRTUAL_ENV_DISABLE_PROMPT=true
export DIRENV_LOG_FORMAT=
export GOPATH="$HOME/.go"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--no-bold --no-info --bind=ctrl-n:down,ctrl-e:up'
