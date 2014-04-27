typeset -U path     # uniques

# make sure right perl/ruby are here
export PERLBREW_ROOT=~/.perl5/perlbrew
source /opt/perl5/etc/bashrc
source /opt/rvm/scripts/rvm

function prepend_to_path    { path=("$1" $path); }
function append_to_path     { path+=("$1"); }
function prepend_to_manpath { manpath=("$1" $manpath); }
function append_to_manpath  { manpath+=("$1"); }

prepend_to_path /usr/local/texlive/2013/bin/i386-linux
prepend_to_path /usr/local/bin
prepend_to_path ~/bin

append_to_manpath /usr/local/texlive/2013/texmf-dist/doc/man

export PATH
