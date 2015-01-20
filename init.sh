#!/bin/bash
set -e

DOTFILES_DIR=$(readlink -f `dirname $0`)
cd $DOTFILES_DIR

# init submodules
git submodule init
git submodule update

# konsole
ln -s ~/dotfiles/konsole/profiles ~/.kde/share/apps/konsole
ln -s ~/dotfiles/konsole/konsolerc ~/.kde/share/config/konsolerc

# other configs
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/i3 ~/.i3
ln -s ~/dotfiles/xsessionrc ~/.xsessionrc

# binaries
mkdir -p ~/bin
for file in "$DOTFILES_DIR/bin/*"; do
  ln -s $file ~/bin/
done
