" Templates
autocmd BufNewFile *.c    0 r $HOME/.vim/template/template.c
autocmd BufNewFile *.cpp  0 r $HOME/.vim/template/template.cpp
autocmd BufNewFile *.html 0 r $HOME/.vim/template/template.html
autocmd BufNewFile *.py   0 r $HOME/.vim/template/template.py
autocmd BufNewFile *.rb   0 r $HOME/.vim/template/template.rb
autocmd BufNewFile *.sh   0 r $HOME/.vim/template/template.sh
autocmd BufNewFile *.tex  0 r $HOME/.vim/template/template.tex

" Encodings & File formats
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,shift_jis
set fileformats=unix,mac,dos
set backspace=indent,eol,start

" No vi compatibility
set nocompatible

" View
language en_US.UTF-8
syntax on
set nowrap
set confirm
set cursorline
set mouse=a
set number
set showcmd
set showmatch
set ruler
set scrolloff=8
set laststatus=2

" Indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set pastetoggle=<F4>

" Remap
nmap j gj
nmap k gk
nmap <S-h> 5h
nmap <S-l> 5l
nnoremap ; :
imap <C-j> <C-o>gj
imap <C-k> <C-o>gk
imap <C-h> <Left>
imap <C-l> <Right>
inoremap <S-Tab> <C-d>

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Completion
set wildmenu
set wildmode=list:full

" Binary edit mode
augroup Binary
  autocmd!
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
