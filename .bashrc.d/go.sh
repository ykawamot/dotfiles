#
# .bashrc.d/go.sh
#

pathappend "$HOME/.go" GOPATH

test -d "/usr/local/opt/go/libexec/bin" && pathappend "/usr/local/opt/go/libexec/bin"
