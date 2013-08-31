set nocompatible              
filetype off        

" Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
  Bundle 'gmarik/vundle'
  Bundle 'scrooloose/nerdtree'
  Bundle 'airblade/vim-gitgutter'
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable syntax highlighting
syntax on

" Tabs should be converted to a group of 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab 

" Turn tabs into spaces
set smarttab

" Hotkey to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Colorscheme
colors peachpuff

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Show line numbers
set number

" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

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

" Reset colors for vim-gitgutter plugin
" It will use colors from the current colorscheme
highlight clear SignColumn

