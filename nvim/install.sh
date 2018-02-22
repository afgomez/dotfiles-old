#!/bin/bash

set -e

config=$HOME/.config/nvim

if [ ! -d $config ]; then
  mkdir -p $config
fi

cache=$HOME/.cache/nvim
if [ ! -d $cache ]; then
  mkdir -p $cache
  mkdir -p $cache/undo
fi

# Manually symlink init file
if [ ! -e $config/init.vim ]; then
  ln -s $DOTFILES/nvim/init.vim $config/init.vim
fi

# Install vim-plug if it doesn't exist

if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
