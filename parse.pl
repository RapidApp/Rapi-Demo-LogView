#!/usr/bin/env perl

use strict;
use warnings;

use Path::Class qw/file dir/;
use App::YG::Apache::Combined;
use DateTime;
use Date::Parse;

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
  
  # Parse and convert date to SQLite 'datetime' format
  if(my $epoch = Date::Parse::str2time( $rec->{date} )) {
    my $dt = DateTime->from_epoch( epoch => $epoch, time_zone => 'local' );
    $rec->{date} = join(' ',$dt->ymd('-'),$dt->hms(':'));
  }

  # Consider '-' as unset/null
  $rec->{$_} eq '-' and delete $rec->{$_} for (keys %$rec);

  push @recs, $rec; 

}


use FindBin;
use lib "$FindBin::Bin/lib";

use Rapi::Demo::LogView;

my $hostRs = Rapi::Demo::LogView->model('DB::Host');
my %hosts = ();
$hosts{$_->{host}} ||= $hostRs->find_or_create({ address => $_->{host} }) for (@recs);

my $Rs = Rapi::Demo::LogView->model('DB::RequestLog');

$Rs->populate(\@recs);

