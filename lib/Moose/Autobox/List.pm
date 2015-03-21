package Moose::Autobox::List;
# ABSTRACT: the List role
use Moose::Role 'with', 'requires';
use Moose::Autobox;
use namespace::autoclean;

our $VERSION = '0.16';

with 'Moose::Autobox::Value';

requires 'head';
requires 'tail';
requires 'length';
requires 'join';
requires 'grep';
requires 'map';
requires 'sort';
requires 'reverse';

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

=head1 DESCRIPTION

This is a role to describes a List interface. This is not
meant to be any specific Perl type, but instead an interface
that certain Perl types might implement. Currenly only
L<Moose::Autobox::Array> implements this.

=head1 METHODS

=over 4

=item C<reduce>

=item C<zip>

=back

=over 4

=item C<meta>

=back

=head1 REQUIRED METHODS

=over 4

=item C<head>

=item C<tail>

=item C<join>

=item C<length>

=item C<map>

=item C<grep>

=item C<reverse>

=item C<sort>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=cut
