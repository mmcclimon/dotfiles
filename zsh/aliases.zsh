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
alias gc='git commit'
alias ga='git add'

# use gs for '$VCS status' all the time
function gs() {
    local svndir="$(svn info 2>/dev/null)"
    if [ -n "$svndir" ]; then
        svn status --ignore-externals | grep -v '^X'
    else
        git status -sb
    fi
}

function gd() {
    local svndir="$(svn info 2>/dev/null)"
    if [ -n "$svndir" ]; then
        svn diff "$@" | view -
    else
        git diff "$@"
    fi
}

# misc.
alias latexwatch='latexmk -xelatex -pvc'
alias info='info --vi-keys'
alias bedtime='pmset displaysleepnow'
alias seleniumserver='java -jar /usr/local/lib/selenium-server-standalone-2.41.0.jar -Dwebdriver.firefox.bin=/Users/michael/Applications/Firefox.app/Contents/MacOS/firefox-bin'
