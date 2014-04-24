# Push and pop directories on directory stack
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias pu='pushd'
alias po='popd'
alias cpwd='cd $(pwd -P)'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# directory madness
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
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
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias .='source'

# git
alias gs='git status -sb'
alias gd='git diff'
alias gc='git commit'
alias ga='git add'

# misc.
alias latexwatch='latexmk -xelatex -pvc'
alias info='info --vi-keys'
alias throttle_wifi='sudo iw dev wlan0 set bitrates legacy-2.4 1 2 5.5 11'
