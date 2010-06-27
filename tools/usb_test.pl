#!/home/mjubenville/lcoal/bin/perl

use Find::Lib '/Users/mjubenville/RocketLauncher/lib/local';

use Modern::Perl;
use Data::Dumper::Concise;
use Device::USB;
use Device::USB::MissileLauncher::RocketBaby;

my $usb = Device::USB->new();

my $busses = $usb->find_busses();
my $device_find = $usb->find_devices();

my @devices = $usb->list_devices();

foreach my $device (@devices) {
    say "\n**********";
    say "Device:     " . $device->{device};
    say "Filename    " . $device->{filename};
    say "Product ID: " . $device->{descriptor}->{idProduct};
    say "Vendor  ID: " . $device->{descriptor}->{idVendor};
    say "**********";
    say "Descriptor:";
    say Dumper $device->{descriptor};
    say "**********";
    say "Config:";
    say Dumper $device->{config};
    #foreach my $key (keys %{$device}) {
    #    say $key . ":";
    #    if ($key eq "config") {
    #        say Dumper $device->{$key};
    #    } elsif ($key eq "descriptor") {
    #        
    #        say Dumper $device->{$key};
    #    } else {
    #        say $device->{$key};
    #    }
    #}
    say "**********";
}

exit 1;
