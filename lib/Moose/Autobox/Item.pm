package Moose::Autobox::Item;
# ABSTRACT: the Item role
use Moose::Role 'requires';
use namespace::autoclean;

our $VERSION = '0.16';

requires 'defined';

sub dump {
    my $self = shift;
    require Data::Dumper;
    return Data::Dumper::Dumper($self);
}

*perl = \&dump;

1;
__END__

=pod

=head1 DESCRIPTION

This is the root of our role hierarchy.

=head1 METHODS

=over 4

=item C<meta>

=item C<dump>

Calls Data::Dumper::Dumper.

=item C<perl>

Same as C<dump>. For symmetry with Perl6's .perl method.

Like &print with newline.

=item C<print2>

=back

=head1 REQUIRED METHODS

=over 4

=item C<defined>

=back

=cut
