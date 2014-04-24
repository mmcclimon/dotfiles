LIB_PATH=$HOME/.zsh

# make sure the path gets set first
source $LIB_PATH/path.zsh

source $LIB_PATH/aliases.zsh
source $LIB_PATH/colors.zsh
source $LIB_PATH/completion.zsh
source $LIB_PATH/correction.zsh
source $LIB_PATH/functions.zsh
source $LIB_PATH/history.zsh
source $LIB_PATH/key-bindings.zsh
source $LIB_PATH/misc.zsh
source $LIB_PATH/prompt.zsh
source $LIB_PATH/termsupport.zsh

autoload -U compinit
compinit -C

