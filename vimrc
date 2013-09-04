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
set runtimepath^=~/.vim/bundle/ctrlp.vim

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

" Colorscheme
colors peachpuff

" Show line numbers
set number

" Highlight symbols after 80th column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/

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
let g:airline_theme='bubblegum'

" Use patched fonts with vim-airline 
let g:airline_powerline_fonts = 1

" No lag when leaving insert mode with vim-airline plugin activated
set ttimeoutlen=50

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=999

" Turn off swap files
set noswapfile

"auto reload if file saved externally
set autoread   

" With these two settings autoread will work (almost) properly
set updatetime=1000
au CursorHold * checktime

" CtrlP buffers switcher
map <C-b> :CtrlPBuffer<CR>

