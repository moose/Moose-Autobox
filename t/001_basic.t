#!/usr/bin/perl

use strict;
use warnings;

use Test::More no_plan => 1;

BEGIN {
    use_ok('Moose::Autobox');
    use_ok('Moose::Autobox::Undef');
}

use autobox UNDEF => 'Moose::Autobox::Undef';

# SCALAR & UNDEF

my $s;
ok(!$s->defined, '... got a undefined value');

$s = 5;
ok($s->defined, '... got a defined value');

# CODE

my $f1 = sub { @_ };
ok($f1->defined, '... created function');

my $f2 = eval { $f1->curry(1, 2, 3)  };
ok($f2->defined, '... created curried function');

my $f3 = eval { $f1->rcurry(1, 2, 3) };
ok($f3->defined, '... created right-curried function');

is_deeply(
[ $f2->(4, 5, 6) ],
[ 1, 2, 3, 4, 5, 6 ],
'... got the right return value from the curried function');
    
is_deeply(
[ $f3->(4, 5, 6) ],
[ 4, 5, 6, 1, 2, 3 ],
'... got the right return value from the r-curried function');  

ok((sub { 1 })->disjoin(sub { 0 })->(), '... disjoins properly');
ok(!(sub { 1 })->conjoin(sub { 0 })->(), '... conjoins properly');

#my $compose = (sub { 1, @_ })->compose(sub { 2, @_ });

#is_deeply(
#[ $compose->() ],
#[ 1, 2 ],
#'... got the right return value for compose');

    
# ARRAY    
    
my $a = [ 4, 2, 6, 78, 101, 2, 3 ];

is($a->length, 7, '... got the right length');
ok($a->defined, '... got the right defined value');

is_deeply(
$a->map(sub { $_ + 2 }),
[ map { $_ + 2 } (4, 2, 6, 78, 101, 2, 3) ],
'... got the right return value for map');

is_deeply($a, [ 4, 2, 6, 78, 101, 2, 3 ], '... original value is unchanged');

is_deeply(
$a->reverse(),
[ 3, 2, 101, 78, 6, 2, 4 ],
'... got the right return value for reverse');

is_deeply($a, [ 4, 2, 6, 78, 101, 2, 3 ], '... original value is unchanged');

is_deeply(
$a->grep(sub { $_ < 50 }),
[ grep { $_ < 50 } (4, 2, 6, 78, 101, 2, 3) ],
'... got the right return value grep');

is_deeply($a, [ 4, 2, 6, 78, 101, 2, 3 ], '... original value is unchanged');

is($a->join(', '), '4, 2, 6, 78, 101, 2, 3', '... got the right joined string');
ok($a->exists(0), '... exists works');
ok(!$a->exists(10), '... exists works');

is($a->pop(), 3, '... got the right pop-ed value');
is_deeply($a, [ 4, 2, 6, 78, 101, 2 ], '... original value is now changed');

is($a->shift(), 4, '... got the right unshift-ed value');
is_deeply($a, [ 2, 6, 78, 101, 2 ], '... original value is now changed');

is_deeply(
$a->unshift(10), 
[ 10, 2, 6, 78, 101, 2 ], 
'... got the correct unshifted value');

is_deeply(
$a->unshift(15, 20, 30), 
[ 15, 20, 30, 10, 2, 6, 78, 101, 2 ], 
'... got the correct unshifted value (multiple values)');

is_deeply(
$a->push(10), 
[ 15, 20, 30, 10, 2, 6, 78, 101, 2, 10 ], 
'... got the correct pushed value');

is_deeply(
$a->push(15, 20, 30), 
[ 15, 20, 30, 10, 2, 6, 78, 101, 2, 10, 15, 20, 30 ], 
'... got the correct pushed value (multiple values)');

is_deeply(
$a->sort(sub { $_[0] <=> $_[1] }), 
[ 2, 2, 6, 10, 10, 15, 15, 20, 20, 30, 30, 78, 101 ],
'... got the correct sorted value');

is_deeply(
$a, 
[ 15, 20, 30, 10, 2, 6, 78, 101, 2, 10, 15, 20, 30 ], 
'... the original values are unchanged');

is_deeply(
[]->push(10, 20, 30)->map(sub { ($_, $_ + 5) })->reverse, 
[ 35, 30, 25, 20, 15, 10 ], 
'... got the correct chained value');

# Hash

my $h = { one => 1, two => 2, three => 3 };

ok($h->defined, '... got the right defined value');




