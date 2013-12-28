#!/bin/bash

# st2
ln -s ~/dotfiles/st2/Preferences.sublime-settings ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings
ln -s ~/dotfiles/st2/Ruby.sublime-settings ~/.config/sublime-text-2/Packages/User/Ruby.sublime-settings
ln -s ~/dotfiles/st2/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-2/Packages/User/Default\ \(Linux\).sublime-keymap

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/Xdefaults ~/.Xdefaults
ln -s ~/dotfiles/i3 ~/.i3
ln -s ~/dotfiles/xsessionrc ~/.xsessionrc

# binaries
mkdir -p ~/bin
ln -s ~/dotfiles/bin/scrshot ~/bin/scrshot

