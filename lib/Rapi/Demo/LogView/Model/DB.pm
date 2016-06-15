package Rapi::Demo::LogView::Model::DB;
use Moo;
extends 'Catalyst::Model::DBIC::Schema';
with 'RapidApp::Util::Role::ModelDBIC';

use strict;
use warnings;

use Path::Class qw(file);
use RapidApp::Util ':all';
my $db_path = file( RapidApp::Util::find_app_home('Rapi::Demo::LogView'), 'rapi_demo_logview.db' );
sub _sqlt_db_path { "$db_path" };    # exposed for use by the regen devel script

__PACKAGE__->config(
  schema_class => 'Rapi::Demo::LogView::DB',

  connect_info => {
    dsn             => "dbi:SQLite:$db_path",
    user            => '',
    password        => '',
    quote_names     => q{1},
    sqlite_unicode  => q{1},
    on_connect_call => q{use_foreign_keys},
  },

  # Configs for the RapidApp::RapidDbic Catalyst Plugin:
  RapidDbic => {

    # use only the relationship column of a foreign-key and hide the
    # redundant literal column when the names are different:
    hide_fk_columns => 1,

    # The grid_class is used to automatically setup a module for each source in the
    # navtree with the grid_params for each source supplied as its options.
    grid_class  => 'Rapi::Demo::LogView::Module::GridBase',
    grid_params => {
      # The special '*defaults' key applies to all sources at once
      '*defaults' => {
        include_colspec => ['*'],    #<-- default already ['*']
        ## uncomment these lines to turn on editing in all grids
        #updatable_colspec   => ['*'],
        #creatable_colspec   => ['*'],
        #destroyable_relspec => ['*'],
        extra_extconfig => {
          store_button_cnf => {
            save => { showtext => 1 },
            undo => { showtext => 1 }
          }
        }
      }
    },

    # TableSpecs define extra RapidApp-specific metadata for each source
    # and is used/available to all modules which interact with them
    TableSpecs => {
      RequestLog => {
        display_column => 'id',
        title          => 'RequestLog',
        title_multi    => 'RequestLog Rows',
        iconCls        => 'ra-icon-pg',
        multiIconCls   => 'ra-icon-pg-multi',
        columns        => {
          id => {
            allow_add => 0,
            header    => 'id',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          host => {
            header => 'host',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          ident => {
            header => 'ident',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          authuser => {
            header => 'authuser',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          date => {
            header => 'date',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          request => {
            header => 'request',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          status => {
            header => 'status',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          bytes => {
            header => 'bytes',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          referer => {
            header => 'referer',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          useragent => {
            header => 'useragent',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
        },
      },
      HttpStatus => {
        display_column => 'code',
        title          => 'HttpStatus',
        title_multi    => 'HttpStatus Rows',
        iconCls        => 'ra-icon-pg',
        multiIconCls   => 'ra-icon-pg-multi',
        columns        => {
          code => {
            allow_add => 0,
            header    => 'code',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          description => {
            header => 'description',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          request_logs => {
            header => 'request_logs',
            #width => 100,
            #sortable => 1,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
        },
      },
    },
  },

);

## ------
## Uncomment these lines to have the schema auto-deployed during
## application startup when the sqlite db file is missing:
#before 'setup' => sub {
#  my $self = shift;
#  return if (-f $db_path);
#  $self->schema_class->connect($self->connect_info->{dsn})->deploy;
#};
## ------

=head1 NAME

Rapi::Demo::LogView::Model::DB - Catalyst/RapidApp DBIC Schema Model

=head1 SYNOPSIS

See L<Rapi::Demo::LogView>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Rapi::Demo::LogView::DB>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema::ForRapidDbic - 0.65

=head1 AUTHOR

Henry Van Styn

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
