# path stuff

function prepend_to_path -d 'add a thing to the path'
    set PATH $argv[1] $PATH
end

function prepend_to_manpath -d 'add a thing to the manpath'
    set MANPATH $argv[1] $MANPATH
end

function append_to_path -d 'add a thing to the path'
    set PATH $PATH $argv[1]
end

set -p PATH ~/bin

if status is-login
    prepend_to_path /usr/local/bin
    prepend_to_path /usr/local/sbin
    prepend_to_path (brew --prefix)"/opt/coreutils/libexec/gnubin"
    prepend_to_manpath (brew --prefix)/opt/coreutils/libexec/gnuman
    prepend_to_path $HOME/.cargo/bin
    append_to_path "$HOME/.go/bin"
    source (rbenv init - | psub)
    source (plenv init - | psub)
    source (pyenv init - | psub)
    eval (direnv hook fish)
end
