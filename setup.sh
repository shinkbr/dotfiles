#!/usr/bin/env bash

dotdir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

files=(
gitconfig
gitignore
tmux.conf
vim
vimperatorrc
vimrc
zshrc
zsh-syntax-highlighting
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
