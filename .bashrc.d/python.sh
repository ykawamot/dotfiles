# git clone https://github.com/yyuu/pyenv.git ~/.pyenv
test -d $HOME/.pyenv && {
  export PYENV_ROOT=$HOME/.pyenv
  pathprepend $PYENV_ROOT/bin

  eval "$(pyenv init -)"
  pathprepend $PYENV_ROOT/shims

  # git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
  test -d $PYENV_ROOT/plugins/pyenv-virtualenv && {
    eval "$(pyenv virtualenv-init -)"
    pathprepend $PYENV_ROOT/plugins/pyenv-virtualenv/shims
  }
}

