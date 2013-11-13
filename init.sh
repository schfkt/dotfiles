#!/bin/bash

# make links to sublime settings files
ln -s ~/dotfiles/st2/Preferences.sublime-settings ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings
ln -s ~/dotfiles/st2/Ruby.sublime-settings ~/.config/sublime-text-2/Packages/User/Ruby.sublime-settings
ln -s ~/dotfiles/st2/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-2/Packages/User/Default\ \(Linux\).sublime-keymap

# make link to tmux config
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# make link to vim config
ln -s ~/dotfiles/vimrc ~/.vimrc

# link to urxvt config
ln -s ~/dotfiles/Xdefaults ~/.Xdefaults

# i3
ln -s ~/dotfiles/i3 ~/.i3

