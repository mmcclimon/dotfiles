typeset -U path     # uniques

function prepend_to_path    { path=("$1" $path); }
function append_to_path     { path+=("$1"); }
function prepend_to_manpath { manpath=("$1" $manpath); }
function append_to_manpath  { manpath+=("$1"); }

# append_to_path /usr/local/texbin

# make sure right perl/ruby are here
# use historical settings on other macs
hostname=$(hostname -s)
if [[ $hostname == 'trane' || $hostname == 'newk' ]]
then
    prepend_to_path /usr/local/bin
    prepend_to_path /usr/local/sbin
    prepend_to_path $(brew --prefix)/opt/coreutils/libexec/gnubin
    prepend_to_manpath $(brew --prefix)/opt/coreutils/libexec/gnuman
    append_to_path "$HOME/.cargo/bin"
    append_to_path "$HOME/.go/bin"
    append_to_path /Applications/Postgres.app/Contents/Versions/latest/bin
    eval "$(rbenv init -)"
    eval "$(plenv init - zsh)"
    eval "$(pyenv init -)"
    eval "$(direnv hook zsh)"
fi
unset hostname

prepend_to_path ~/bin

# Dunno about this, but let's try it!
typeset -U cdpath
cdpath=("$HOME/code/fm" $cdpath)

export GOPATH="$HOME/.go"
export PATH
