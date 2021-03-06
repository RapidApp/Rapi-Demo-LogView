use utf8;
package Rapi::Demo::LogView::DB::Result::RequestLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("request_log");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "host",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 15 },
  "ident",
  { data_type => "varchar", is_nullable => 1 },
  "authuser",
  { data_type => "varchar", is_nullable => 1 },
  "date",
  { data_type => "datetime", is_nullable => 0 },
  "request",
  { data_type => "varchar", is_nullable => 0 },
  "status",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "bytes",
  { data_type => "integer", is_nullable => 1 },
  "referer",
  { data_type => "varchar", is_nullable => 1 },
  "useragent",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "host",
  "Rapi::Demo::LogView::DB::Result::Host",
  { address => "host" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);
__PACKAGE__->belongs_to(
  "status",
  "Rapi::Demo::LogView::DB::Result::HttpStatus",
  { code => "status" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-06-15 01:25:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yoC2wemiJebpxZSlMd4KoA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
