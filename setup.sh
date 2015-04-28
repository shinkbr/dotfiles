#!/bin/bash

dotdir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

files=(
zshrc
zsh-syntax-highlighting
vim
vimrc
tmux.conf
gitconfig
gitignore
vimperatorrc
)

red='\033[31m'
nocolor='\033[0m'

for f in ${files[@]}
do
  if [ ! -e ~/.${f} ]
  then
    echo "ln -s ${dotdir}/${f} ~/.${f}"
    ln -s ${dotdir}/${f} ~/.${f}
  else
    echo -e "${red}~/.${f} exists.${nocolor}"
  fi
done

echo ""
echo "You should also symbolic-link your zshenv file as necessary."
