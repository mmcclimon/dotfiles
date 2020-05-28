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
