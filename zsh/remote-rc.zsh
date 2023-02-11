# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/export/home/michael/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/dotfiles/zsh/colors.zsh

alias gs='git status -sb'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias ls='ls --color'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias tls='tmux ls'

# prompt colors

reset="%{$reset_color%}"
eval pgreen="%{[38;5;110m%}"
eval pgray="%{[38;5;243m%}"
eval pdate="%{[38;5;243m%}"

export PROMPT="
$pgreen%n@%m$reset${pgray}[%~]$reset$pgreen%#$reset "
export RPROMPT="$pdate%D{%Y%m%d-%H:%M:%S}$reset "
export TERM='xterm-256color'
export PAGER='less'
export LESS='-R'
export EDITOR='vim'

function tmat () {
    if [[ -z "$@" ]]; then
        tmux attach
    else
        tmux attach -t "$@"
    fi
}

# fix stupid ssh/tmux problem
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
