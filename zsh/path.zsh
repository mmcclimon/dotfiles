PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:~/bin
PATH=$PATH:/usr/texbin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/Applications/Postgres93.app/Contents/MacOS/bin

# put GNU coreutils first in the path
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
export PATH


# make sure right perl/ruby are here
export PERLBREW_ROOT=~/.perl5/perlbrew
source ~/.perl5/perlbrew/etc/bashrc
source ~/.rvm/scripts/rvm

