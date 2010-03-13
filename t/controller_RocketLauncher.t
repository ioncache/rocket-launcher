use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'rocket_launcher' }
BEGIN { use_ok 'rocket_launcher::Controller::RocketLauncher' }

ok( request('/rocketlauncher')->is_success, 'Request should succeed' );
done_testing();
