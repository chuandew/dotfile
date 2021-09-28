#!/bin/bash

echo "create .zshrc"
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc

echo "create .vimrc"
rm ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc

echo "create .gitignore_global"
rm ~/.gitignore_global
ln -s `pwd`/gitignore_global ~/.gitignore_global

echo "create .gitconfig"
rm ~/.gitconfig
ln -s `pwd`/gitconfig ~/.gitconfig

echo "create .aspell.conf"
rm ~/.aspell.conf
ln -s `pwd`/aspell.conf ~/.aspell.conf

echo "create .ideavimrc"
rm ~/.ideavimrc
ln -s `pwd`/ideavimrc ~/.ideavimrc

echo "create .tmux.conf"
rm ~/.tmux.conf
ln -s `pwd`/tmux.conf ~/.tmux.conf

echo "create .doom.d dir"
rm -rf ~/.doom.d
ln -s `pwd`/doom.d ~/.doom.d

