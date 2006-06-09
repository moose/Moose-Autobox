
package Moose::Autobox::List;
use Moose::Role 'with', 'requires';
use autobox;

our $VERSION = '0.01';

with 'Moose::Autobox::Value';

requires qw/
    head 
    tail
    length 
    join     
    grep 
    map 
    sort
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
                [ $array->at($_), $other->at($_) ]
            });
}

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::List - the List role

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;

=head1 DESCRIPTION

=head1 BUGS

All complex software has bugs lurking in it, and this module is no 
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut