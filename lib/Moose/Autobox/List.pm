
package Moose::Autobox::List;
use Moose::Role 'with', 'requires';
use autobox;

our $VERSION = '0.01';

with 'Moose::Autobox::Indexed';

requires qw/
    head
    tail
    length 
    join     
    grep map sort
    reverse
/;

sub reduce {
    my ($array, $func) = @_;
    my $a = $array->values;
    my $acc = $a->head;
    $a->tail->map(sub { $acc = $func->($acc, $_) });
    return $acc;
}

sub zip {
    my ($array, $other) = @_;
    ($array->length < $other->length 
        ? $other 
        : $array)
            ->keys
            ->map(sub {
                [ $array->[$_], $other->[$_] ]
            });
}

1;