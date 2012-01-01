#!/bin/sh -x

git submodule init
git submodule update

# symlink for vim-pathogen
mkdir -p $PWD/.vim/autoload
ln -s $PWD/.vim/bundle/vim-pathogen/autoload/pathogen.vim $PWD/.vim/autoload/

# symlink for brew bash completion
which brew > /dev/null && (
  BREW_PREFIX=`brew --prefix`
  ln -s $BREW_PREFIX/Library/Contributions/brew_bash_completion.sh \
        $BREW_PREFIX/etc/bash_completion.d/brew_bash_completion.sh
)
