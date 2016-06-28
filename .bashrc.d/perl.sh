# Begin ~/.bashrc.d/20-perl

export PERL5OPT="-MCarp=verbose"

# perlbrew
test -d $HOME/perl5/perlbrew && {
  . $HOME/perl5/perlbrew/etc/bashrc
  . $HOME/perl5/perlbrew/etc/perlbrew-completion.bash
}

# End ~/.bashrc.d/20-perl
