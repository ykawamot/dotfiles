#!/bin/sh -x

git submodule init
git submodule update

mkdir -p $PWD/.vim/autoload
ln -s $PWD/.vim/bundle/vim-pathogen/autoload/pathogen.vim $PWD/.vim/autoload/

