#!perl -w

use strict;
use Test::More tests => 6;


my $string = join "no urls";

use_ok('URI::Find::Iterator');

my $it;
ok($it = URI::Find::Iterator->new($string), "create new");

my $foo = 1;
while (my ($quux, $bar) = $it->match()) {
	$foo = 0;
	last;
}
is($foo,1, "Checking to see if it terminates");


ok($it = URI::Find::Iterator->new($string), "create new again");

$foo = 1;
while (my $quux = $it->match()) {
    $foo = 0;
    last;
}
is($foo,1, "Checking to see if it terminates again");

is ($it->result, $string, "replaced properly");



