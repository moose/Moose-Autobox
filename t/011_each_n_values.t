use strict;
use warnings;
use Test::More;

use Moose::Autobox;

{
    my @array = ('a' .. 'z');

    my $aref = [ @array ];

    {
        my @vals;
        @array->each_n_values(2, sub { push @vals, [@_] });
        is(scalar @vals, 13);
        is(scalar @$_, 2) for @vals;
        is_deeply(@vals->map(sub { @{ $_ } }), [@array]);
    }

    {
        my @vals;
        $aref->each_n_values(2, sub { push @vals, [@_] });
        is(scalar @vals, 13);
        is(scalar @$_, 2) for @vals;
        is_deeply(@vals->map(sub { @{ $_ } }), $aref);
    }
}

done_testing;
