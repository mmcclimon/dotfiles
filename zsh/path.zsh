typeset -U path     # uniques

# make sure right perl/ruby are here
export PERLBREW_ROOT=~/perl5/perlbrew
source ~/perl5/perlbrew/etc/bashrc
source ~/.rvm/scripts/rvm

function prepend_to_path    { path=("$1" $path); }
function append_to_path     { path+=("$1"); }
function prepend_to_manpath { manpath=("$1" $manpath); }
function append_to_manpath  { manpath+=("$1"); }

prepend_to_path /usr/local/bin
prepend_to_path /usr/local/sbin
prepend_to_path $(brew --prefix)/opt/coreutils/libexec/gnubin
prepend_to_manpath $(brew --prefix)/opt/coreutils/libexec/gnuman
prepend_to_path ~/bin

append_to_path /usr/texbin

export PATH
