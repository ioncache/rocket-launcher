package rocket_launcher::View::Web;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

rocket_launcher::View::Web - TT View for rocket_launcher

=head1 DESCRIPTION

TT View for rocket_launcher.

=head1 SEE ALSO

L<rocket_launcher>

=head1 AUTHOR

Mark Jubenville

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
