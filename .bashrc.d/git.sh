#
# .bashrc.d/git.sh
#

# __git_ps1()
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

# hub
# $ curl http://hub.github.com/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
which hub &>/dev/null && {
  eval "$(hub alias -s)"
}
