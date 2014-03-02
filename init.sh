#!/bin/bash
DOTFILES_DIR=$(readlink -f `dirname $0`)
cd $DOTFILES_DIR

# init submodules
git submodule init
git submodule update

# sublime's configs
for file in "$DOTFILES_DIR/st3/*"; do
  ln -s $file ~/.config/sublime-text-3/Packages/User/
done

# other configs
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/Xdefaults ~/.Xdefaults
ln -s ~/dotfiles/i3 ~/.i3
ln -s ~/dotfiles/xsessionrc ~/.xsessionrc

# binaries
mkdir -p ~/bin
for file in "$DOTFILES_DIR/bin/*"; do
  ln -s $file ~/bin/
done
