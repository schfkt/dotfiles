set nocompatible
filetype off


" -----------------------------------------------------------------------------
" Bundles
" -----------------------------------------------------------------------------

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
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'altercation/vim-colors-solarized'
Bundle 'moll/vim-node'

set runtimepath^=~/.vim/bundle/ctrlp.vim


" -----------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------

filetype plugin on
filetype indent on
syntax on
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set encoding=utf-8
set number
set hidden " Allows to switch buffers without saving changes
set autoread " Auto reload if file saved externally
set hlsearch " Highlight search terms
set incsearch " Show search matches as you type
set ignorecase " Ignore case when searching
set colorcolumn=80 " Ruler at 80th column
set cursorline " Highlight current line

" Write with sudo
cnoremap w!! w !sudo tee % >/dev/null

" Trim whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Ignore node_modules folders
set wildignore+=*/node_modules/*


" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

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


" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------

set t_Co=256
colorscheme solarized

if has('gui_running')
  set background=light
else
  set background=dark
endif

hi ColorColumn ctermbg=8
hi clear SignColumn
hi CursorLineNR ctermbg=0 ctermfg=NONE gui=NONE guifg=NONE guibg=#EEE8D5


" -----------------------------------------------------------------------------
" Hotkeys
" -----------------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
map <F2> :CtrlPBuffer<CR>
nnoremap <F10> :Ag<Space>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remap : to ; in normal mode
nnoremap ; :


" -----------------------------------------------------------------------------
" Settings for plugins
" -----------------------------------------------------------------------------

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" No lag when leaving insert mode with vim-airline plugin activated
set ttimeoutlen=50

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0


" -----------------------------------------------------------------------------
" GUI-specific settings
" -----------------------------------------------------------------------------

if has('gui_running')
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12

  " Turn off all GUI shit (menu bar, scrollbars, etc)
  set guioptions=

  " Disable mouse
  set mouse=
  map <ScrollWheelUp> <nop>
  map <ScrollWheelDown> <nop>
endif

