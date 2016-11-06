#!/bin/bash
echo "create .zshrc"
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc

#echo "update submodules"
