package RocketLauncher::View::Web;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.html',
    render_die => 1,
);

=head1 NAME

RocketLauncher::View::Web - TT View for RocketLauncher

=head1 DESCRIPTION

TT View for RocketLauncher.

=head1 SEE ALSO

L<RocketLauncher>

=head1 AUTHOR

Mark Jubenville

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
