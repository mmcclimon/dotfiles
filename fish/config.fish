# it's a config file, for fish!

source $__fish_config_dir/path.fish
source $__fish_config_dir/keybindings.fish

function reload; source $HOME/.config/fish/config.fish; end

# standard aliases
alias gs "git status -sb"
alias gd "git diff"
alias ga "git add"
alias gc "git commit"
alias tls "tmux ls"

function ..
    cd ..
end

## pager
set -gx PAGER "less"
set -gx LESS "-R"
set -gx EDITOR vim
set -gx MANLESS ''
set -gx MANWIDTH 80
set -gx MANPAGER 'col -b | view -c "set ft=man" -'

function perldoc
    cpandoc -otext $argv | view -c "set ft=man" -
end

## misc environment vars
if test -n "$TMUX"
    set -gx DISABLE_AUTO_TITLE true
end

set -gx LC_CTYPE $LANG
set -gx VIRTUAL_ENV_DISABLE_PROMPT true
set -gx NOPASTE_SERVICES GitLab
set -gx DIRENV_LOG_FORMAT ''
set -gx CLICOLOR 1
set -gx LSCOLORS "gxexcxdxbxegedabagacGg"

# gnu ls colors
if test -e "$HOME/.dircolors"
    eval (dircolors -c $HOME/.dircolors)
end
