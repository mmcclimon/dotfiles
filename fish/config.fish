# it's a config file, for fish!

function reload; source $HOME/.config/fish/config.fish; end

function gs; git status -sb; end

function gd
    git diff $argv
end

function ga
    git add $argv
end

function ..
    cd ..
end

function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings
