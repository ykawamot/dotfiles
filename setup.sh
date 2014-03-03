#!/bin/sh -x

# symlink for brew bash completion
which brew > /dev/null && (
  BREW_PREFIX=`brew --prefix`
  brew install bash-completion
  ln -s $BREW_PREFIX/Library/Contributions/brew_bash_completion.sh \
        $BREW_PREFIX/etc/bash_completion.d/brew_bash_completion.sh
)
