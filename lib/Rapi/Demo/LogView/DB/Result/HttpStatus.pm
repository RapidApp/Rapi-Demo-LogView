use utf8;
package Rapi::Demo::LogView::DB::Result::HttpStatus;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("http_status");
__PACKAGE__->add_columns(
  "code",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("code");
__PACKAGE__->has_many(
  "request_logs",
  "Rapi::Demo::LogView::DB::Result::RequestLog",
  { "foreign.status" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-06-14 20:34:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KwFSRq4KHAl/Mi/w3VbepA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
