package Moose::Autobox::Scalar;
# ABSTRACT: the Scalar role
use Moose::Role 'with';
use namespace::autoclean;

our $VERSION = '0.17';

with 'Moose::Autobox::String',
     'Moose::Autobox::Number';

sub flatten { $_[0] }
sub first { $_[0] }
sub last  { $_[0] }
sub print { CORE::print $_[0] }
sub say   { CORE::print $_[0], "\n" }

1;
__END__

=pod

=head1 DESCRIPTION

This is a role to describes a Scalar value, which is defined
as the combination (union sort of) of a String and a Number.

=head1 METHODS

=over 4

=item C<meta>

=item C<print>

=item C<say>

=item C<flatten>

Flattening a scalar just returns the scalar.  This means that you can say:

  my @array = $input->flatten;

  # Given $input of 5, @array is (5);
  # Given $input of [ 5, 2, 0], @array is (5, 2, 0)

=item C<first>

As per flatten.

=item C<last>

As per flatten.

=back

=cut
