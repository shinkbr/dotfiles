set nocompatible
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,shift_jis
set fileformats=unix,mac,dos
set backspace=indent,eol,start

"View
syntax on
set confirm
set cursorline
set mouse=a
set number
set showcmd
set showmatch
set ruler
highlight Comment ctermfg=32

"Tab
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

"Remap
nnoremap j gj
nnoremap k gk
map <Down> j
map <Up> k

"Search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

"Completion
set wildmenu
set wildmode=list:full

"Autocmds
autocmd BufNewFile *.c 0r $HOME/.vim/template/template.c
autocmd BufNewFile *.java 0r $HOME/.vim/template/template.java
