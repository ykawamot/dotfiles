#!/usr/bin/perl -w
use strict;
use warnings;
use Cwd;

my @files = qw(
    .bash_completion
    .bash_completion.d
    .bash_profile
    .bashrc
    .bashrc.d
    .digrc
    .dir_colors
    .gitconfig
    .gitignore
    .rspec
    .vim
    .vimrc
);

my $pwd = getcwd;
for my $file (@files) {
    my $src = "$pwd/$file";
    my $dst = "$ENV{HOME}/$file";
    mkcmd($src => $dst);
}

sub mkcmd {
    my ($src, $dst) = @_;

    if (!-e $src) {
        print "# missing source: $src\n";
    }
    elsif (-e $dst) {
        print "# $dst is exists\n";
    }
    else {
        print "ln -s $src $dst\n";
    }
}

1;
