#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;
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

my $scalar = 1;
is_deeply(
  [ $scalar->flatten ],
  [ 1 ],
  "flattening a scalar returns the scalar",
);

my $scalar_ref = \$scalar;
is_deeply(
  [ $scalar_ref->flatten ],
  [ \$scalar ],
  "flattening a reference to a scalar returns the same scalar reference",
);
