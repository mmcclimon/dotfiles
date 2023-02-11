## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs
setopt long_list_jobs

setopt correct

# colors
[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

[ -e "$HOME/.dircolors" ] && eval `dircolors -b $HOME/.dircolors`
alias ls='ls --color'

## pager
export PAGER="less"
export LESS="-R"
export EDITOR=vim
export MANLESS=''
export MANWIDTH=80
export MANPAGER=manpager

function perldoc() { cpandoc -otext $@ }

## misc environment vars
# export TEXMFHOME="$HOME/.texmf"

export LC_CTYPE=$LANG
export VIRTUAL_ENV_DISABLE_PROMPT=true
export NOPASTE_SERVICES=GitLab
export DIRENV_LOG_FORMAT=

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--no-bold --no-info --bind=ctrl-n:down,ctrl-e:up'

hr() { printf '-%.0s' $(seq $COLUMNS) }

function print_bear() {
    local bears=( 'ʕ•ᴥ•ʔ' 'ʕᵔᴥᵔʔ' 'ʅʕ•ᴥ•ʔʃ' 'ʕ•̀o•́ʔ' 'ʕ·ᴥ·ʔ' 'ᶘ ᵒᴥᵒᶅ')
    print -r ${bears[$RANDOM % $#bears + 1]}
}

# yes, print a bear on new shells.
print_bear
