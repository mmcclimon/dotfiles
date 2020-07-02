autoload colors
colors

[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

typeset -Ag FG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
done

# os x ls colors
export CLICOLOR=1
export LSCOLORS="gxexcxdxbxegedabagacGg"

# gnu ls colors
[ -e "$HOME/.dircolors" ] && eval `dircolors -b $HOME/.dircolors`
alias ls='ls --color'
