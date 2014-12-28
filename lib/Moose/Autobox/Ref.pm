package Moose::Autobox::Ref;
# ABSTRACT: the Ref role
use Moo::Role 'with';
use namespace::autoclean;

our $VERSION = '0.16';

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

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=cut
