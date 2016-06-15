package Rapi::Demo::LogView::Module::GridBase;

use strict;
use warnings;

use Moose;
extends 'Catalyst::Plugin::RapidApp::RapidDbic::TableBase';

use RapidApp::Util ':all';

# The ResultSet chains through this method, if defined
sub ResultSet {
  my $self = shift;
  my $Rs = shift;
  
  if($self->ResultSource->source_name eq 'RequestLog') {
  
    my $c = RapidApp->active_request_context;
    
    $Rs = $Rs->search_rs({ 'me.status' => { '!=' => 200 } }) if (
      $c && $c->can('check_any_user_role') &&
      ! $c->check_any_user_role(qw/administrator code_200/)
    );
  
  }
  
  return $Rs
}


1;

