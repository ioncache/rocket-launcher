package rocket_launcher::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

use Modern::Perl;

use Find::Lib '/Users/mjubenville/rocket_launcher/lib/local';

use Data::Dumper::Concise;
use Device::USB;
use RocketBaby;

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

rocket_launcher::Controller::Root - Root Controller for rocket_launcher

=head1 DESCRIPTION

USB Rocket Launcher web interface

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $usb = Device::USB->new();
    my $dev = $usb->find_device( 6465, 32801 );

    if(defined $dev) {
        $self->{rocket} = RocketBaby->new(6465, 32801);
    }

}

sub rocket_command : Local {
    my ( $self, $c ) = @_;

    my $command = $c->req->params->{'command'};

    if($self->{rocket}->cando($command)) {
        $self->{rocket}->do($command);
    }

    #$c->stash->{current_view} = 'Web::UI::JSON';
    $c->response->body( "ok" );

}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Mark Jubenville

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
