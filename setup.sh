#!/usr/bin/env bash

dotdir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

files=(
gitconfig
gitignore
tmux.conf
vim
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

echo ""
echo "You should also symbolic-link your zshenv file as necessary."
