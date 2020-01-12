reset="%{$reset_color%}"
eval pgreen='$FG[108]'
eval pgray='$FG[243]'
eval pdate='$FG[243]'

# overwrite usual default
_gprompt () {}

export PROMPT="
$pgreen%n@%m$reset${pgray}[%~]$reset$pgreen%#$reset "
export RPROMPT="$pdate%D{%Y%m%d-%H:%M:%S}$reset "
