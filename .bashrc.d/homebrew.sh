# $ brew install coreutils
which brew &>/dev/null && {
  GNU_PREFIX=$(brew --prefix coreutils 2>/dev/null)
  test -d $GNU_PREFIX && {
    pathprepend $GNU_PREFIX/libexec/gnubin
    pathprepend $GNU_PREFIX/libexec/gnuman MANPATH
  }
  unset GNU_PREFIX
}

test -d $HOME/.pyenv/shims && {
  function brew() {
    local PATH=${PATH/$HOME\/.pyenv\/shims:/}
    command brew "$@"
  }
}
