#!/bin/bash
echo "create .zshrc"
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc

echo "create .vimrc"
rm ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc

echo "create .gitconfig"
rm ~/.gitconfig
ln -s `pwd`/gitconfig ~/.gitconfig
#echo "update submodules"
