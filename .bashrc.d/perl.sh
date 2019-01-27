#
# .bashrc.d/perl.sh
#

export PERL5OPT="-MCarp=verbose"

# perlbrew
# $ \curl -L https://install.perlbrew.pl | bash
test -d "$HOME/perl5/perlbrew" && {
  source "$HOME/perl5/perlbrew/etc/bashrc"
  source "$HOME/perl5/perlbrew/etc/perlbrew-completion.bash"

  eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
}

