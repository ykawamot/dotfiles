#!/bin/bash

test -t 1 && {
  C_PREFIX='\033[1;31m'
  C_SUFFIX='\033[0m'
}

# symlink for brew bash completion
which brew > /dev/null 2>&1 && {
  BREW_PREFIX=`brew --prefix`
  brew ls bash-completion > /dev/null && {
    test ! -e $BREW_PREFIX/etc/bash_completion.d/brew_bash_completion.sh && {
      echo "ln -s $BREW_PREFIX/Library/Contributions/brew_bash_completion.sh \\"
      echo "      $BREW_PREFIX/etc/bash_completion.d/brew_bash_completion.sh"
    }
  }
}

DOT_FILES=(
  .bash_completion
  .bash_completion.d
  .bash_profile
  .bashrc
  .bashrc.d
  .digrc
  .dir_colors
  .gitconfig
  .gitignore
  .inputrc
  .rspec
  .tmux.conf
  .vim
  .vimrc
)

for file in ${DOT_FILES[@]} ; do
    src=$PWD/$file
    dst=$HOME/$file

    if [ ! -e $src ] ; then
        echo -e "# ${C_PREFIX}Warning${C_SUFFIX}: missing $src"
    elif [ -e $dst ] ; then
        echo -e "# ${C_PREFIX}Warning${C_SUFFIX}: exists $dst"
    else
        echo "ln -s $src $dst"
    fi
done

