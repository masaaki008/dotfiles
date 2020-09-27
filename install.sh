#!/bin/sh

SCRIPT_DIR_PATH=$(cd $(dirname $0);pwd)

# dircolor設定
ln -fns ${SCRIPT_DIR_PATH}/dircolors/.dircolors ~/.dircolors

# zsh設定
ln -fns ${SCRIPT_DIR_PATH}/.zprofile ~/.zprofile
ln -fns ${SCRIPT_DIR_PATH}/.zshenv ~/.zshenv
ln -fns ${SCRIPT_DIR_PATH}/.zshrc ~/.zshrc

# vim設定
ln -fns ${SCRIPT_DIR_PATH}/.vimrc ~/.vimrc
mkdir -p ~/.config/nvim
mkdir -p ~/.vim/bundles
mkdir -p ~/.config/vim
ln -fns ${SCRIPT_DIR_PATH}/.vimrc ~/.config/nvim/init.vim
ln -fns ${SCRIPT_DIR_PATH}/dein ~/.config/vim
