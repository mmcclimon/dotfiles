export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/texbin
export PATH=$PATH:/usr/local/share/npm/bin
export HISTCONTROL=ignoredups
# export PERL5LIB="/Users/mmcclimon/perl5/test/lib/perl5/site_perl"

export CLICOLOR=1
export LSCOLORS="gxExcxdxbxegedabagacGg"

export EDITOR="vim"
export ALTERNATE_EDITOR=''

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gs='git status -sb'
alias ld='cd ~-'
alias pavan='ssh mjmcclim@pavan.music.indiana.edu'
alias medley='ssh mjmcclim@medley.music.indiana.edu'
alias ec='emacsclient -n'
alias ecc='emacsclient -c -n'

# compiles and runs a C++ program (if compiler succeeds) in one step
mcc() {
	name=`echo $1 | sed 's/\(.*\)\..*/\1/'`;
	g++ -Wall -Wextra -std=c++98 -pedantic -o $name $1;

	if  [ $? -eq 0 ]
		then ./$name;
	fi
}

# put this in a function, since I don't use RVM a lot
start_rvm() { source ~/.rvm/scripts/rvm; }


# colors for prompt
NORMAL="\[\e[0m\]"
PROMPT_C="\[\e[38;5;074m\]"
DIR_C="\[\e[38;5;237m\]"
BRANCH_C="\[\e[38;5;023m\]"
SHA1_C="\[\e[38;5;022m\]"
GIT_STATUS_C="\[\e[38;5;009m\]"

set_ps1_vars() {
    local gitdir=$(git rev-parse --git-dir 2> /dev/null)
    if [ -n "$gitdir" ]; then
        # in a git repo, set vars accordingly
        bGIT_PROMPT_LEFT='['
        bGIT_PROMPT_MIDDLE='|'
        bGIT_PROMPT_RIGHT=']'
        bGIT_CURRENT_BRANCH=$(git symbolic-ref HEAD 2> /dev/null | cut -d '/' -f 3)
        bGIT_CURRENT_SHA1=$(git rev-parse --short HEAD 2> /dev/null)
        local g_status=$(git status --porcelain 2> /dev/null)
        if [ -z "$g_status" ]; then
            bGIT_CURRENT_STATUS=''
        else
            bGIT_CURRENT_STATUS='*'
        fi
    else
        # not in git repo, clear variables
        bGIT_PROMPT_LEFT=''
        bGIT_PROMPT_MIDDLE=''
        bGIT_PROMPT_RIGHT=''
        bGIT_CURRENT_BRANCH=''
        bGIT_CURRENT_SHA1=''
        bGIT_CURRENT_STATUS=''
    fi

}

if [ $USER = "mmcclimon" ]; then
    export PROMPT_COMMAND="set_ps1_vars"
fi

# prompt business
PS1="\n${PROMPT_C}(\t)${NORMAL} ${DIR_C}\w${NORMAL}"
# now add git info
PS1="${PS1} ${BRANCH_C}\$bGIT_PROMPT_LEFT\$bGIT_CURRENT_BRANCH${NORMAL}${DIR_C}\$bGIT_PROMPT_MIDDLE${NORMAL}${SHA1_C}\$bGIT_CURRENT_SHA1${NORMAL}${BRANCH_C}\$bGIT_PROMPT_RIGHT${NORMAL}${GIT_STATUS_C}\$bGIT_CURRENT_STATUS${NORMAL}"

# now add newline with prompt
PS1="${PS1}\n${PROMPT_C}\$${NORMAL} "

if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
fi

source ~/perl5/perlbrew/etc/bashrc
start_rvm
