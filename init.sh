#!/bin/bash
set -euo pipefail

dotdir=${PWD##"$HOME/"}

# you're home now
cd "$HOME"

maybe_link() {
  local want=$1
  local src="$dotdir/$2"

  if ! [[ -L "$want" ]]; then
    echo "$src -> $want..."
    ln -s "$src" "$want"
  fi
}

# link:    homedir       dotdir
maybe_link ".zsh"        "zsh"
maybe_link ".zshrc"      "zsh/zshrc"

maybe_link ".gitignore"  "git/ignore"
maybe_link ".gitconfig"  "git/config"
maybe_link ".tigrc"      "git/tigrc"

maybe_link ".vim"        "vim"
maybe_link ".vimrc"      "vim/vimrc"
maybe_link ".gvimrc"     "vim/gvimrc"

maybe_link ".tmux.conf"  "tmux.conf"
maybe_link ".dircolors"  "dircolors"
