# Push and pop directories on directory stack
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# directory madness
alias d='dirs -v | head -10'

alias history='fc -il 1'

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

# directory shortcuts
hash -d txbe=~/code/fm/Topicbox-Backend
hash -d txfe=~/code/fm/Topicbox-Frontend
hash -d hm=~/code/fm/hm
hash -d ix=~/code/fm/Ix
