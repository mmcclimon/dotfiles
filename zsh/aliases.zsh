# Push and pop directories on directory stack
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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
alias gitn='git --no-pager'

# tmux
alias tls='tmux ls'

# directory shortcuts
function maybe_hash_dir {
  [[ -d "$2" ]] && hash -d "$1"="$2"
}

maybe_hash_dir txbe ~/code/fm/Topicbox-Backend
maybe_hash_dir txfe ~/code/fm/Topicbox-Frontend
maybe_hash_dir hm ~/code/fm/hm
maybe_hash_dir ix ~/code/fm/Ix

unfunction maybe_hash_dir
