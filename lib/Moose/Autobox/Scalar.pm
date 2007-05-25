package Moose::Autobox::Scalar;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::String',
     'Moose::Autobox::Number';     
     
sub print { CORE::print $_[0] }
sub say   { CORE::print $_[0], "\n" }
1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Scalar - the Scalar role

=head1 DESCRIPTION

This is a role to describes a Scalar value, which is defined 
as the combination (union sort of) of a String and a Number.

=head1 METHODS

=over 4

=item B<meta>

=item B<print>

=item B<say>

=back

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
