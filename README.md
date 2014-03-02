# Brief description

    .
    ├── bin
    │   ├── backup                           # simple backup script (uses rdiff-backup)
    │   ├── exclude_filelist.cfg             # list of folders that are excluded from backup
    │   ├── i3-toggle-bar                    # shows/hides i3bar
    │   ├── nautilus                         # wrapper for the nautilus (prevents it to show desktop)
    │   ├── scrshot                          # makes screenshot and saves it to the __Public__ folder in dropbox
    │   └── user-menu                        # shows simple menu, see description below
    ├── i3
    │   ├── config                           # main config for i3wm
    │   └── status.conf                      # config for i3bar
    ├── init.sh                              # init script (initializes submodules, makes links e.g)
    ├── lib                                  # some external libraries (these are just git submodules)
    │   ├── oh-my-zsh
    │   ├── zsh-completions
    │   ├── zsh-history-substring-search
    │   └── zsh-syntax-highlighting
    ├── st3                                  # configs for sublime-text 3
    │   ├── Default (Linux).sublime-keymap
    │   ├── Package Control.sublime-settings
    │   └── Preferences.sublime-settings
    ├── tmux.conf                            # config for tmux
    ├── vimrc                                # config for vim & gvim
    ├── Xdefaults                            # contains only settings for urxvt
    ├── xsessionrc                           # some hacks for gnome-keyring-daemon (to make it work with i3)
    ├── zsh                                  # configs for zsh
    │   ├── aliases
    │   ├── config
    │   ├── custom
    │   │   └── schfkt.zsh-theme             # my custom theme for prompt
    │   └── functions
    └── zshrc                                # main zsc config (source all the stuf from __zsh__ dir)
