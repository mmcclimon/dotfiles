# autoloaded function path
typeset -U fpath
fpath=("$LIB_PATH/functions" $fpath)

if [[ -d /opt/local/share/zsh/site-functions ]]; then
    fpath=(/opt/local/share/zsh/site-functions $fpath)
elif [[ -d /opt/homebrew/share/zsh/site-functions ]]; then
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi

# I am a bit surprised there doesn't seem to be a way to do this automatically
for f in $LIB_PATH/functions/*; {
    autoload -Uz $(basename $f)
}

function print_bear() {
    local bears=( 'ʕ•ᴥ•ʔ' 'ʕᵔᴥᵔʔ' 'ʅʕ•ᴥ•ʔʃ' 'ʕ•̀o•́ʔ' 'ʕ·ᴥ·ʔ' 'ᶘ ᵒᴥᵒᶅ')
    print -r ${bears[$RANDOM % $#bears + 1]}
}

function maybe_source() {
    if [[ -f "$1" ]]; then
        source "$1"
    fi
}
