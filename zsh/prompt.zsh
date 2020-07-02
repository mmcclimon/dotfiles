# assumes 'colors' has been sourced before this
typeset -A C
C[reset]="%{$reset_color%}"
C[gray]="${FG[242]}"
C[blue]="${FG[004]}"
C[brick]="${FG[124]}"
C[teal]="${FG[023]}"
C[red]="${FG[001]}"

# Git prompt info
function gprompt() {
    # is_gitdir at_or_on branch_or_sha is_dirty
    local gitinfo=(`git prompt-info`)

    if [[ ${gitinfo[1]} -eq 0 ]] {
        return
    }

    print -n " ${gitinfo[2]} ${C[teal]}${gitinfo[3]}"

    if [[ $gitinfo[4] -eq 1 ]] {
        print -n "${C[red]}*"
    }
}


# vi mode madness
############################

export KEYTIMEOUT=1
vim_ins_mode="${C[blue]}\$"
vim_cmd_mode="${C[gray]}\$"
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
PROMPT="$NEWLINE${C[gray]}[%18<...<%~%<<\$(gprompt)${C[gray]}] \${vim_prompt}${C[reset]} "

RPS1="${C[gray]}%* [%(?..${C[brick]})%?${C[gray]}]${C[reset]}"
