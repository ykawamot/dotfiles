# Begin ~/.bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ] ; then
  . /etc/bashrc
fi

# manipulate paths
# 
# Functions to help us manage paths. Second argument is the name of the
# path variable to be modified (default: PATH)
#
# Link: http://www.linuxfromscratch.org/blfs/view/svn/postlfs/profile.html
pathremove() { # {{{
  local IFS=':'
  local NEWPATH
  local DIR
  local PATHVARIABLE=${2:-PATH}
  for DIR in ${!PATHVARIABLE} ; do
    if [ "$DIR" != "$1" ] ; then
      NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
    fi
  done
  export $PATHVARIABLE="$NEWPATH"
} # }}}

pathprepend() { # {{{
  pathremove $1 $2
  local PATHVARIABLE=${2:-PATH}
  export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
} # }}}

pathappend() { # {{{
  pathremove $1 $2
  local PATHVARIABLE=${2:-PATH}
  export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
} # }}}

# run scripts in .bashrc.d
#
# Link: http://www.turnkeylinux.org/blog/generic-shell-hooks
run_scripts() { # {{{
  for script in $1/* ; do
    # run directory recursively
    [ -d "$script" ] && run_scripts $script && continue
    
    # skip non-executable snippets
    [ -x "$script" ] || continue
    
    # execute $script in the context of the current shell
    . $script
  done
} # }}}

run_scripts ~/.bashrc.d

# load local settings
[ -f ~/.bashrc.local ] && . ~/.bashrc.local

# Now to clean up
unset pathremove pathprepend pathappend

# End ~/.bashrc
