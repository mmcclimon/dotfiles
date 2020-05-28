function mjm_bindings --description "vi bindings plus some niceties"
    fish_vi_key_bindings

    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search
    bind -M insert \ca beginning-of-line
    bind -M insert \ce accept-autosuggestion
    bind -M insert \cf suppress-autosuggestion
    bind -M insert \cb backward-char
    bind -M insert \cw backward-kill-path-component
    bind -M insert \cr history-prefix-search-backward
end

set -g fish_key_bindings mjm_bindings
