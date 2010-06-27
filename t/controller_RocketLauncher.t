use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'RocketLauncher' }
BEGIN { use_ok 'RocketLauncher::Controller::RocketLauncher' }

ok( request('/rocketlauncher')->is_success, 'Request should succeed' );
done_testing();
