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
  
  #my $keys = [qw/Host Ident Authuser Date Request Status Bytes Referer UserAgent/];
  my $keys = App::YG::Apache::Combined::labels();
  
  #lower-case key names to match column names:
  @$keys = map { lc($_) } @$keys;
  
  scalar(@$keys) == scalar(@$vals) or die "key/val count mismatch";
  my $i = 0;
  my $rec = { map { $_ => $vals->[$i++] } @$keys };
  
  push @recs, $rec; 

}


use Data::Printer;
p @recs;





