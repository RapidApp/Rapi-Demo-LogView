#!/usr/bin/env perl

use strict;
use warnings;

use Path::Class qw/file dir/;
use App::YG::Apache::Combined;

# Read log file supplied on command line:
my $path = $ARGV[0] or die "missing arguments";
my $fh   = file($path)->open('r') or die "Can't read $path: $!";

my @recs = ();
while(my $line = $fh->getline) {

  my $vals = App::YG::Apache::Combined::parse($line);



}


















