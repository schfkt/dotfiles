#!/bin/bash

# init submodules
git submodule init
git submodule update

# create links
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/Xdefaults ~/.Xdefaults
ln -s ~/dotfiles/i3 ~/.i3
ln -s ~/dotfiles/xsessionrc ~/.xsessionrc

# binaries
mkdir -p ~/bin
ln -s ~/dotfiles/bin/scrshot ~/bin/scrshot

