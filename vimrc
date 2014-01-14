set nocompatible
filetype off

" Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
  Bundle 'gmarik/vundle'
  Bundle 'scrooloose/nerdtree'
  Bundle 'godlygeek/tabular'
  Bundle 'Valloric/YouCompleteMe'
  Bundle 'majutsushi/tagbar'
  Bundle 'bling/vim-airline'
  Bundle 'tpope/vim-fugitive'
  Bundle 'kien/ctrlp.vim'
  Bundle 'scrooloose/syntastic'
  Bundle 'mhinz/vim-signify'
  Bundle 'digitaltoad/vim-jade'
  Bundle 'rking/ag.vim'
  Bundle 'slim-template/vim-slim'
  Bundle 'pangloss/vim-javascript'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'dart-lang/dart-vim-plugin'
set runtimepath^=~/.vim/bundle/ctrlp.vim

set t_Co=256

"load ftplugins and indent files
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on

" Tabs should be converted to a group of 2 spaces
set shiftwidth=2
set tabstop=2

" Turn tabs into spaces
set expandtab

set smarttab

" Use UTF-8
set encoding=utf-8

" Hotkey to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Show line numbers
set number

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Allows to switch buffers without saving changes
set hidden

" vim-airline theme
let g:airline_theme='luna'

" Use patched fonts with vim-airline
let g:airline_powerline_fonts = 1

" No lag when leaving insert mode with vim-airline plugin activated
set ttimeoutlen=50

"auto reload if file saved externally
set autoread

" CtrlP buffers switcher
map <F2> :CtrlPBuffer<CR>

" ignore node_modules folders
set wildignore+=*/node_modules/*

" ruler at 80th column
set colorcolumn=80
highlight ColorColumn ctermbg=8

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" ignore case when searching
set ignorecase

" remap : to ; in normal mode
" very useful, less keypresses
nnoremap ; :

" colorscheme
colorscheme solarized
set background=dark

if has('gui_running')
  " disable mouse
  set mouse=
  " set font
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  " turn off all GUI shit (menu bar, scrollbars, etc)
  set guioptions=
  " disable mouse wheel
  map <ScrollWheelUp> <nop>
  map <ScrollWheelDown> <nop>
endif

highlight clear SignColumn

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" close all opened buffers
nmap <F9> :%bd<CR>

" run Ag
nnoremap <F10> :Ag<Space>

