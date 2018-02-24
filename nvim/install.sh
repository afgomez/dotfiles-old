#!/bin/bash

set -e

config=$HOME/.config

if [ ! -d $config ]; then
  mkdir -p $config
fi

cache=$HOME/.cache/nvim
if [ ! -d $cache ]; then
  mkdir -p $cache
  mkdir -p $cache/undo
fi

# Manually symlink init file
if [ ! -e $config/nvim ]; then
  ln -s $DOTFILES/nvim/config $config/nvim
fi

# Install vim-plug if it doesn't exist

if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
