# Push and pop directories on directory stack
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# directory madness
alias d='dirs -v | head -10'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi

# ls
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias .='source'

# git
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gs='git status -sb'

# tmux
alias tls='tmux ls'
function tmat () {
    if [[ -z "$@" ]]; then
        tmux attach
    else
        tmux attach -t "$@"
    fi
}

function gcd() {
    local TOP=$(git rev-parse --show-toplevel 2> /dev/null) || return 1
    [[ "$TOP" ]] && cd "$TOP"
}

# directory shortcuts
hash -d txbe=~/code/fm/Topicbox-Backend
hash -d txfe=~/code/fm/Topicbox-Frontend
hash -d hm=~/code/fm/hm
hash -d ix=~/code/fm/Ix
