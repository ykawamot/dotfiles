# Begin ~/.bash_profile

if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

# End ~/.bash_profile

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
