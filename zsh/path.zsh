typeset -U path     # uniques

function prepend_to_path    { path=("$1" $path); }
function append_to_path     { path+=("$1"); }
function prepend_to_manpath { manpath=("$1" $manpath); }
function append_to_manpath  { manpath+=("$1"); }
function command_exists     { command -v "$1" >/dev/null }

function maybe_prepend_to_path {
  if [[ -d "$1" ]]; then
    prepend_to_path "$1"
  fi
}

HOMEBREW_ROOT=

if [[ -x /opt/homebrew/bin/brew ]]; then
  HOMEBREW_ROOT=/opt/homebrew   # apple silicon
elif [[ -x /usr/local/bin/brew ]]; then
  HOMEBREW_ROOT=/usr/local      # apple intel
fi

if [[ -n "$HOMEBREW_ROOT" ]]; then
  prepend_to_path $HOMEBREW_ROOT/bin
  prepend_to_path $HOMEBREW_ROOT/sbin
  prepend_to_path $HOMEBREW_ROOT/opt/coreutils/libexec/gnubin
fi

maybe_prepend_to_path "$HOME/.plenv/bin"
maybe_prepend_to_path "$HOME/.pyenv/bin"
maybe_prepend_to_path "$HOME/.cargo/bin"
maybe_prepend_to_path "$HOME/local/bin"

if command_exists plenv; then
  eval "$(plenv init - zsh)"
fi

if command_exists pyenv; then
  export PYENV_SHELL=zsh
  prepend_to_path "$HOME/.pyenv/shims"
  maybe_source "$HOME/.pyenv/completions/pyenv.zsh"
fi

if command_exists mise; then
    export MISE_INSTALL_PATH="$HOME/local/bin/mise"
    export MISE_DATA_DIR="$HOME/local/share/mise"
    eval "$(mise activate zsh)"
fi

prepend_to_path ~/bin

# I like this, but this is probably not useful any more, so.
typeset -U cdpath
cdpath=("$HOME/code/mongo" $cdpath)
