#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;

BEGIN {
    use_ok('Moose::Autobox');
}

use Moose::Autobox;

is_deeply(
1->to(5),
[ 1, 2, 3, 4, 5 ],
'... got 1 to 5');

is_deeply(
5->to(1),
[ 5, 4, 3, 2, 1 ],
'... got 5 to 1');

is_deeply(
1->to(1),
[ 1 ],
'... got 1 to 1');

