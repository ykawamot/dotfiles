#
# .bashrc.d/ruby.sh
#

# rvm
# $ \curl -sSL https://get.rvm.io | bash -s stable
test -d "$HOME/.rvm" && {
  # Add RVM to PATH for scripting
  pathappend "$HOME/.rvm/bin"

  # Load RVM into a shell session *as a function*
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
}
