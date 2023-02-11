# I stole this from somewhere, probably ohmyzsh, in the long-distant past.

# usage: title short_tab_title window_title
function title {
  if [[ "$DISABLE_AUTO_TITLE" == "true" ]] || [[ -n "$TMUX" ]]; then
    return
  fi

  if [[ "$TERM" == screen* ]]; then
    # set screen hardstatus, usually truncated at 20 chars
    print -Pn "\ek$1:q\e\\"
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ $TERM == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" # set window name
    print -Pn "\e]1;$1:q\a" # set icon (=tab) name (will override window name on broken terminal)
  fi
}

#Appears when you have the prompt
function title_idle {
  local idle_tab_title="%15<..<%~%<<" #15 char left truncated PWD
  local idle_window_title="%n@%m: %~"
  title $idle_tab_title $idle_window_title
}

#Appears at the beginning of (and during) of command execution
function title_active {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  local LINE="${2:gs/$/\\$}"
  LINE="${LINE:gs/%/%%}"
  title "$CMD" "%100>...>$LINE%<<"
}

autoload -U add-zsh-hook
add-zsh-hook precmd  title_idle
add-zsh-hook preexec title_active
