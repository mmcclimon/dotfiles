# Colors
############################
reset="%{$reset_color%}"

# assumes 'colors' has been sourced before this
eval pblue='$FG[004]'
eval pgray='$FG[242]'
#eval branch_c='%{$fg[green]%}'
eval branch_c='$FG[023]'
eval status_c='$FG[001]'
eval venv_c='$FG[022]'

# Git prompt info
############################
git_prompt=''

function _gprompt() {
    local gprompt=''
    local gitdir="$(git rev-parse --git-dir 2> /dev/null)"

    if [ -n "$gitdir" ]; then
        # show the branch if we're on one, the sha if we don't
        local pbranch=''
        local branch=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/}
        if [ -n "$branch" ]; then
            pbranch=" on $branch_c$branch$reset"
        else
            local sha="$(git rev-parse --short HEAD 2>/dev/null)"
            pbranch=" at $branch_c$sha$reset"
        fi

        local gstatus="$(git status --porcelain 2> /dev/null)"
        local p_star=''
        if [ -n "$gstatus" ]; then
            p_star="*"
        fi
        local pstatus="$status_c$p_star$reset"

        gprompt="${pbranch}${pstatus}"
    fi

    git_prompt=$gprompt
}

venv_prompt=''

function _venv_prompt() {
    local vprompt=''
    local venv_name="${VIRTUAL_ENV##*/}"

    if [ -n "$venv_name" ]; then
        vprompt="${venv_c}(${venv_name})$reset"
    fi

    venv_prompt=$vprompt
}

svn_prompt=''

function _svn_prompt() {
    local sprompt=''
    local sdir="$(svn info 2>/dev/null)"

    if [ -n "$sdir" ]; then
        local rev=$(svn info 2>/dev/null | grep '^Revision' | sed -e 's/Revision: //')
        local dirty=''
        [ "$(svn status --ignore-externals | grep -v '^X')" ] && dirty="$status_c*$reset"
        sprompt=" at ${branch_c}r${rev}${reset}${dirty}"
    fi

    svn_prompt="${sprompt}"
}

function precmd() {
    _gprompt
    # _svn_prompt
    # _venv_prompt
}


# vi mode madness
############################

export KEYTIMEOUT=1
vim_ins_mode="$pblue\$$reset"
vim_cmd_mode="$pgray\$$reset"
vim_prompt=$vim_ins_mode

function zle-keymap-select {
  vim_prompt="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_prompt=$vim_ins_mode
}
zle -N zle-line-finish

# function TRAPINT() {
#   vim_prompt=$vim_ins_mode
#   return $(( 128 + $1 ))
# }

# remove ESC maps in vi mode
function noop { }
zle -N noop
bindkey -M vicmd '\e' noop

# now we can actually set the prompt
setopt prompt_subst
PROMPT="
\${venv_prompt}${pgray}[%18<...<%~%<<\${git_prompt}${pgray}\${svn_prompt}]${reset} \${vim_prompt} "

RPS1="${pgray}%*${reset}"
