# gruvbox colors
local gray='#928374'
local blue="#458588"
local teal="#427b58"
local warn="#d79921"
local red="#cc241d"

# Git prompt info
function gprompt() {
    # is_gitdir at_or_on branch_or_sha is_dirty
    local gitinfo=( $(git prompt-info) )

    if [[ ${gitinfo[1]} -eq 0 ]] {
        return
    }

    print -n " ${gitinfo[2]} %F{$teal}${gitinfo[3]}"

    if [[ $gitinfo[4] -eq 1 ]] {
        print -n "%F{$red}*"
    }
}


# vi mode madness
############################

export KEYTIMEOUT=1
local vim_ins_mode="%F{$blue}$"
local vim_cmd_mode="%F{$gray}$"
local vim_replace_mode="%F{$warn}$"
local vim_prompt=$vim_ins_mode

function zle-keymap-select {
    if [[ $KEYMAP == 'vicmd' || $KEYMAP == 'viopp' ]] {
        vim_prompt=$vim_cmd_mode
    } elif [[ $ZLE_STATE =~ 'overwrite' ]] {
        vim_prompt=$vim_replace_mode
    } else {
        vim_prompt=$vim_ins_mode
    }

    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_prompt=$vim_ins_mode
}
zle -N zle-line-finish

# remove ESC maps in vi mode
function noop {}
zle -N noop
bindkey -M vicmd '\e' noop

# now we can actually set the prompt
setopt prompt_subst
setopt transient_rprompt

local newline=$'\n'
local cwd="%18<..<%~%<<"
PROMPT="$newline%F{$gray}[$cwd\$(gprompt)%F{$gray}] \${vim_prompt}%f "

RPS1="%F{$gray}%* [%(?..%F{$warn})%?%F{$gray}]%f"
