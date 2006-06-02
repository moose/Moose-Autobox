#!/usr/bin/perl

use strict;
use warnings;

use Test::More no_plan => 1;

BEGIN {
    use_ok('Moose::Autobox');
}

ok(SCALAR->does('Moose::Autobox::Scalar'),      '... SCALAR does Moose::Autobox::Scalar');
  ok(SCALAR->does('Moose::Autobox::Ref'),       '... SCALAR does Moose::Autobox::Ref');
  ok(SCALAR->does('Moose::Autobox::Value'),     '... SCALAR does Moose::Autobox::Value');
    ok(SCALAR->does('Moose::Autobox::Defined'), '... SCALAR does Moose::Autobox::Defined');
      ok(SCALAR->does('Moose::Autobox::Item'),  '... SCALAR does Moose::Autobox::Item');
      
ok(ARRAY->does('Moose::Autobox::Array'),        '... ARRAY does Moose::Autobox::Array');
  ok(ARRAY->does('Moose::Autobox::List'),       '... ARRAY does Moose::Autobox::List');
  ok(ARRAY->does('Moose::Autobox::Ref'),        '... ARRAY does Moose::Autobox::Ref');
    ok(ARRAY->does('Moose::Autobox::Defined'),  '... ARRAY does Moose::Autobox::Defined');
      ok(ARRAY->does('Moose::Autobox::Item'),   '... ARRAY does Moose::Autobox::Item');      
      
ok(HASH->does('Moose::Autobox::Hash'),          '... HASH does Moose::Autobox::Hash');
  ok(HASH->does('Moose::Autobox::Ref'),         '... HASH does Moose::Autobox::Ref');
    ok(HASH->does('Moose::Autobox::Defined'),   '... HASH does Moose::Autobox::Defined');
      ok(HASH->does('Moose::Autobox::Item'),    '... HASH does Moose::Autobox::Item');
      
ok(CODE->does('Moose::Autobox::Code'),          '... CODE does Moose::Autobox::Code');
  ok(CODE->does('Moose::Autobox::Ref'),         '... CODE does Moose::Autobox::Ref');
    ok(CODE->does('Moose::Autobox::Defined'),   '... CODE does Moose::Autobox::Defined');
      ok(CODE->does('Moose::Autobox::Item'),    '... CODE does Moose::Autobox::Item');      