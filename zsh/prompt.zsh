# Colors
############################
pblue="%{$fg_no_bold[blue]%}"
reset="%{$reset_color%}"

# assumes 'colors' has been sourced before this
eval pgray='$FG[234]'
eval branch_c='$FG[023]'
eval sha_c='$FG[022]'
eval status_c='$FG[009]'

# Git prompt info
############################
gleft="${pgray}[$reset"
gmid="${pgray}|$reset"
gright="${pgray}]$reset"

function _gbranch() {
    local branch=${$(git symbolic-ref HEAD 2>/dev/null)#refs/heads/}
    print -P "$branch_c$branch$reset"
}

function _gsha() {
    local sha="$(git rev-parse --short HEAD 2>/dev/null)"
    print -P "$sha_c$sha$reset"
}

function _gdirty() {
    local gstatus="$(git status --porcelain 2> /dev/null)"
    local p_status=''
    if [ -n "$gstatus" ]; then
        p_status="*"
    fi
    print -P "$status_c$p_status$reset"
}

function _gprompt() {
    local gprompt=''
    local gitdir="$(git rev-parse --git-dir 2> /dev/null)"

    if [ -n "$gitdir" ]; then
        gprompt="${gleft}$(_gbranch)${gmid}$(_gsha)${gright}$(_gdirty)"
    fi

    print -P $gprompt
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

function TRAPINT() {
  vim_prompt=$vim_ins_mode
  return $(( 128 + $1 ))
}

# now we can actually set the prompt
setopt prompt_subst
PROMPT='
${pblue}(%*)${reset} $pgray%~$reset $(_gprompt)
${vim_prompt} '


