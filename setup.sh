#!/usr/bin/env bash

dotdir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

files=(
gitconfig
gitignore
tmux.conf
vim
vimperatorrc
vimrc
zsh-syntax-highlighting
zshrc
)

red='\033[31m'
nocolor='\033[0m'

for f in ${files[@]}
do
  if [ ! -e ~/.${f} ]
  then
    ln -sv ${dotdir}/${f} ~/.${f}
  else
    echo -e "${red}~/.${f} exists.${nocolor}"
  fi
done

# neobundle.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && cd ~/.vim/bundle/vimproc.vim && make

echo ""
echo "You should also symbolic-link your zshenv file as necessary."
