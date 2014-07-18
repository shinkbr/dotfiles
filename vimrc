" Templates
autocmd BufNewFile *.c 0r $HOME/.vim/template/template.c
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp
autocmd BufNewFile *.tex 0r $HOME/.vim/template/template.tex
autocmd BufNewFile *.html 0r $HOME/.vim/template/template.html

" Encodings & File formats
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,shift_jis
set fileformats=unix,mac,dos
set backspace=indent,eol,start

" No vi compatibility
set nocompatible

" View
syntax on
set confirm
set cursorline
set mouse=a
set number
set showcmd
set showmatch
set ruler
set scrolloff=8
highlight Comment ctermfg=32

" Indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" Remap
nmap j gj
nmap k gk
nnoremap ; :
nnoremap : ;
imap <C-j> <C-o>gj
imap <C-k> <C-o>gk
imap <C-h> <Left>
imap <C-l> <Right>

" Brackets completion
inoremap {<Enter> {<Enter>}<Esc>O
autocmd FileType ruby inoremap do<Enter> do<Enter>end<Esc>O

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Completion
set wildmenu
set wildmode=list:full
