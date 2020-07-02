# gruvbox colors
gray='#928374'
blue="#458588"
teal="#427b58"
brick="#d79921"
red="#cc241d"


# Git prompt info
function gprompt() {
    # is_gitdir at_or_on branch_or_sha is_dirty
    local gitinfo=(`git prompt-info`)

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
vim_ins_mode="%F{$blue}\$"
vim_cmd_mode="%F{$gray}\$"
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

newline=$'\n'
cwd="%18<..<%~%<<"
PROMPT="$newline%F{$gray}[$cwd\$(gprompt)%F{$gray}] \${vim_prompt}%f "

RPS1="%F{$gray}%* [%(?..%F{$brick})%?%F{$gray}]%f"
