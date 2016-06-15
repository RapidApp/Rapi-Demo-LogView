use utf8;
package Rapi::Demo::LogView::DB::Result::Host;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("host");
__PACKAGE__->add_columns(
  "address",
  { data_type => "varchar", is_nullable => 0, size => 15 },
  "hostname",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("address");
__PACKAGE__->has_many(
  "request_logs",
  "Rapi::Demo::LogView::DB::Result::RequestLog",
  { "foreign.host" => "self.address" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-06-15 01:25:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fyo+XsUc+mll6fcwDJETzw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
