#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;
use Moose::Autobox;

my $array = [ qw(1 2 3 4 ) ];
is_deeply(
  [ $array->flatten ],
  [ 1, 2, 3, 4 ],
  "flattening an array returns a list",
);

my $hash = { a => 1, b => 2 };
is_deeply(
  [ sort $hash->flatten ],
  [ qw(1 2 a b) ],
  "flattening a hash returns a list",
);
