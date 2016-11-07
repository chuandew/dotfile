#!/bin/bash
echo "create .zshrc"
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc

echo "create .vimrc"
rm ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc

#echo "update submodules"
