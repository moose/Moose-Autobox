package Moose::Autobox::Item;     
use Moose::Role 'requires';

our $VERSION = '0.01';

requires 'defined';

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Item - the Item role

=head1 DESCRIPTION

This is the root of our role hierarchy. 

=head1 METHODS

=over 4

=item B<meta>

=back

=head1 REQUIRED METHODS

=over 4

=item B<defined>

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