#
# .bashrc.d/go.sh
#

pathappend "$HOME/.go" GOPATH
pathappend "$GOPATH/bin"

test -d "/usr/local/opt/go/libexec/bin" && pathappend "/usr/local/opt/go/libexec/bin"
