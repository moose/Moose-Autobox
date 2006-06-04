#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
    use_ok('Moose::Autobox');
}

use autobox;

is_deeply(
[ 1 .. 5 ]->map(sub { $_ * $_ }),
[ 1, 4, 9, 16, 25 ],
'... got the expected return values');

is_deeply(
[ 1 .. 5 ]->map(sub { $_ * $_ })->do(sub { $_->zip($_) }),
[ [1, 1], [4, 4], [9, 9], [16, 16], [25, 25] ],
'... got the expected return values');