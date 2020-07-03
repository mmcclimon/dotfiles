# autoloaded function path
typeset -U fpath
fpath=("$LIB_PATH/functions" $fpath)

# I am a bit surprised there doesn't seem to be a way to do this automatically
for f in $LIB_PATH/functions/*; {
    autoload -Uz $(basename $f)
}
