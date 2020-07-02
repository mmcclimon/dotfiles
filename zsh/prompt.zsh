# Colors
############################
reset="%{$reset_color%}"

# assumes 'colors' has been sourced before this
eval pblue='$FG[004]'
eval pgray='$FG[242]'
#eval branch_c='%{$fg[green]%}'
eval branch_c='$FG[023]'
eval status_c='$FG[001]'
eval pred='$FG[124]'

# Git prompt info
############################
git_prompt=''

function precmd() {
    # is_gitdir at_or_on branch_or_sha is_dirty
    local gitinfo=(`git prompt-info`)

    if [[ ${gitinfo[1]} -eq 0 ]]; then
        git_prompt=""
        return
    fi

    local pstatus=''
    if [[ $gitinfo[4] -eq 1 ]]; then
        pstatus="$status_c*$reset"
    fi

    git_prompt=" ${gitinfo[2]} $branch_c${gitinfo[3]}$reset${pstatus}"
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
setopt transient_rprompt

NEWLINE=$'\n'
PROMPT="$NEWLINE${pgray}[%18<...<%~%<<\${git_prompt}${pgray}]${reset} \${vim_prompt} "

RPS1="${pgray}%* [%(?..${pred})%?${pgray}]${reset}"
