#
# .bashrc.d/homebrew.sh
#

which brew &>/dev/null || return

eval $(brew shellenv)

# coreutils
# $ brew install coreutils
GNU_PREFIX=$(brew --prefix coreutils 2>/dev/null)
test -d "$GNU_PREFIX" && {
  pathprepend "$GNU_PREFIX/libexec/gnubin"
  pathprepend "$GNU_PREFIX/libexec/gnuman" MANPATH
}
unset GNU_PREFIX

# suppress `brew doctor` warnings
test -d "$HOME/.pyenv/shims" && {
  function brew() {
    local PATH=${PATH/$HOME\/.pyenv\/shims:/}
    command brew "$@"
  }
}

LIBS=(
  apr
  apr-util
  curl
  llvm
  )

for lib in "${LIBS[@]}" ; do
  BINDIR=/usr/local/opt/${lib}/bin
  [[ -d ${BINDIR} ]] && pathprepend ${BINDIR}
done
