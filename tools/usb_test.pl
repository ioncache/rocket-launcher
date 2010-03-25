#!/home/mjubenville/lcoal/bin/perl

use Modern::Perl;
use Device::USB;
use Data::Dumper::Concise;
use RocketBaby;
use Time::Hires qw( sleep );
#use Device::USB::MissileLauncher;

my $usb = Device::USB->new();

my $busses = $usb->find_busses();
my $device_find = $usb->find_devices();

my @devices = $usb->list_devices();

#foreach my $device (@devices) {
#    say "\n**********";
#    foreach my $key (keys %{$device}) {
#        say $key . ":";
#        if ($key eq "config") {
#            #say Dumper $device->{$key};
#        } elsif ($key eq "descriptor") {
#            say Dumper $device->{$key};
#        } else {
#            say $device->{$key};
#        }
#    }
#    say "**********";
#}

my $ml = RocketBaby->new(6465, 32801);

while (<>) {
    /j/ && $ml->do("down");
    /k/ && $ml->do("up");
    /h/ && $ml->do("left");
    /l/ && $ml->do("right");
    /f/ && $ml->do("fire");
    /s/ && $ml->do("stop");
    #$ml->do("stop");
}

#my $dev = $usb->find_device( 6465, 32801 );
#$dev->open;
#$dev->detach_kernel_driver_np(0);
#$dev->set_configuration(1);
#$dev->claim_interface(0);
#
#for my $test (1..100) {
#    say $test;
#    sleep 0.5;
#    #$dev->control_msg(0x21, 0x09, 0x02, 0, chr($test), 1, 1000);
#    sleep 0.5;
#    $dev->control_msg(0x21, 0x09, 0x02, 0, chr(20), 1, 1000);
#}

exit 1;
