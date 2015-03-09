#!/bin/bash

dotdir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

declare -a files=(
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

for i in ${files[@]}
do
  if [ ! -e ~/.${i} ]
  then
    echo "ln -s ${dotdir}/${i} ~/.${i}"
    ln -s ${dotdir}/${i} ~/.${i}
  else
    echo -e "${red}~/.${i} exists.${nocolor}"
  fi
done

echo ""
echo "You should also symbolic-link your zshenv file as necessary."
