# prepend: set -p
# append:  set -a

set -p PATH ~/bin

if test (hostname -s) = 'trane'
    set -p PATH /usr/local/bin
    set -p PATH /usr/local/sbin
    set -p PATH (brew --prefix)/opt/coreutils/libexec/gnubin
    set -p MANPATHPATH (brew --prefix)/opt/coreutils/libexec/gnuman
    set -a PATH "$HOME/.go/bin"
    source (rbenv init - | psub)
    source (plenv init - | psub)
    source (pyenv init - | psub)
    eval (direnv hook fish)
end
