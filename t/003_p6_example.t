#!/usr/bin/perl

use strict;
use warnings;

use Test::More no_plan => 1;

BEGIN {
    use_ok('Moose::Autobox');
}

use autobox;

SCALAR->meta->add_method('bytes' => sub {
 $_[0];
});

SCALAR->meta->add_method('byte' => SCALAR->meta->get_method('bytes'));

SCALAR->meta->add_method('kilobytes' => sub {
    $_[0] * 1024;
});

SCALAR->meta->add_method('kilobyte' => SCALAR->meta->get_method('kilobytes'));

SCALAR->meta->add_method('megabytes' => sub {
    $_[0] * 1024->kilobytes;
});

SCALAR->meta->add_method('metabyte' => SCALAR->meta->get_method('megabytes'));

SCALAR->meta->add_method('gigabytes' => sub {
    $_[0] * 1024->megabytes;
});

SCALAR->meta->add_method('gigabyte' => SCALAR->meta->get_method('gigabytes'));

SCALAR->meta->add_method('terabytes' => sub {
    $_[0] * 1024->gigabytes;
});

SCALAR->meta->add_method('terabyte' => SCALAR->meta->get_method('terabytes'));

is(5->bytes,     5,             '... got 5 bytes');
is(5->kilobytes, 5120,          '... got 5 kilobytes');
is(2->megabytes, 2097152,       '... got 2 megabytes');
is(1->gigabyte,  1073741824,    '... got 1 gigabyte');
is(2->terabytes, 2199023255552, '... got 2 terabyte');

