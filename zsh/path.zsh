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

if [[ -x /opt/local/bin/port ]]; then
  prepend_to_path /opt/local/bin
  prepend_to_path /opt/local/sbin
  prepend_to_path /opt/local/libexec/gnubin
fi

maybe_prepend_to_path "$HOME/.plenv/bin"
maybe_prepend_to_path "$HOME/.pyenv/bin"
maybe_prepend_to_path "$HOME/.cargo/bin"
maybe_prepend_to_path "$HOME/.go/bin"

if command_exists plenv; then
  eval "$(plenv init - zsh)"
fi

if command_exists pyenv; then
  export PYENV_SHELL=zsh
  prepend_to_path "$HOME/.pyenv/shims"
  source '/Users/michael/.pyenv/libexec/../completions/pyenv.zsh'
fi

if command_exists direnv; then
  eval "$(direnv hook zsh)"
fi

prepend_to_path ~/bin

export GOPATH="$HOME/.go"

# I like this, but this is probably not useful any more, so.
typeset -U cdpath
# cdpath=("$HOME/code/fm" $cdpath)

