package Moose::Autobox::Ref;
# ABSTRACT: the Ref role
use Moose::Role 'with';
use namespace::autoclean;

our $VERSION = '0.17';

with 'Moose::Autobox::Defined';

1;
__END__

=pod

=head1 DESCRIPTION

This is a role to describes a reference value.

=head1 METHODS

=over 4

=item C<meta>

=back

=cut
