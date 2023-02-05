#!/bin/bash
set -euo pipefail

dotdir=${PWD##$HOME/}

# you're home now
cd $HOME

# zsh
[ -L ".zsh" ]   || ln -s "$dotdir/zsh"       ".zsh"
[ -L ".zshrc" ] || ln -s "$dotdir/zsh/zshrc" ".zshrc"

# git
[ -L ".gitignore" ] || ln -s "$dotdir/git/ignore" ".gitignore"
[ -L ".gitconfig" ] || ln -s "$dotdir/git/config" ".gitconfig"
[ -L ".tigrc" ]     || ln -s "$dotdir/git/tigrc"  ".tigrc"

# vim
[ -L ".vim" ]    || ln -s "$dotdir/vim"        ".vim"
[ -L ".vimrc" ]  || ln -s "$dotdir/vim/vimrc"  ".vimrc"
[ -L ".gvimrc" ] || ln -s "$dotdir/vim/gvimrc" ".gvimrc"

# etc.
[ -L ".tmux.conf" ] || ln -s "$dotdir/tmux.conf" ".tmux.conf"
[ -L ".dircolors" ] || ln -s "$dotdir/dircolors" ".dircolors"
