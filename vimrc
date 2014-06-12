set nocompatible
filetype off

" Change leader to a comma
" This has to be set before vundle starts loading all the plugins
let mapleader=","


" -----------------------------------------------------------------------------
" Bundles
" -----------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-signify'
Plugin 'digitaltoad/vim-jade'
Plugin 'rking/ag.vim'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-node'

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
set splitbelow
set splitright

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
set background=light
hi ColorColumn ctermbg=7
hi clear SignColumn


" -----------------------------------------------------------------------------
" Hotkeys
" -----------------------------------------------------------------------------

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>a :Ag<Space>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remap : to ; in normal mode
nnoremap ; :

" Disable arrow keys (:
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" -----------------------------------------------------------------------------
" Settings for plugins
" -----------------------------------------------------------------------------

let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1

" No lag when leaving insert mode with vim-airline plugin activated
set ttimeoutlen=50

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

let g:ycm_collect_identifiers_from_tags_files = 1

" Auto focus on tagbar window
let g:tagbar_autofocus = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1

