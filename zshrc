for config_file ($HOME/.zsh/*.zsh); do
    source $config_file
done

# aliases
alias .='source'
alias gs='git status -sb'
alias gd='git diff'
alias gc='git commit'
alias ga='git add'
alias gvim="mvim"
alias mvc='mvim --servername mvim --remote-silent'
alias mvcc='mvim --servername mvim'
alias latexwatch='latexmk -xelatex -pvc'

# environment
export CLICOLOR=1
export LSCOLORS="gxexcxdxbxegedabagacGg"

# path
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/texbin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/Postgres93.app/Contents/MacOS/bin

# perl/ruby
export PERLBREW_ROOT=~/.perl5/perlbrew
source ~/.perl5/perlbrew/etc/bashrc
source ~/.rvm/scripts/rvm
