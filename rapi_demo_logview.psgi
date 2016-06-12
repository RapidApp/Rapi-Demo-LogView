use strict;
use warnings;

use Rapi::Demo::LogView;

my $app = Rapi::Demo::LogView->apply_default_middlewares(Rapi::Demo::LogView->psgi_app);
$app;

