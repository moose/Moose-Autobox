package Moose::Autobox::Number;
# ABSTRACT: Moose::Autobox::Number - the Number role
use Moose::Role;
use namespace::autoclean;

our $VERSION = '0.16';

with 'Moose::Autobox::Value';

sub to {
    return [ $_[0] .. $_[1] ] if $_[0] <= $_[1];
    return [ reverse $_[1] .. $_[0] ];
}

1;
__END__

=pod

=head1 DESCRIPTION

This is a role to describes a Numeric value.

=head1 METHODS

=over 4

=item C<to>

Takes another number as argument and produces an array ranging from
the number the method is called on to the number given as argument. In
some situations, this method intentionally behaves different from the
range operator in perl:

  $foo = [ 5 .. 1 ]; # $foo is []

  $foo = 5->to(1);   # $foo is [ 5, 4, 3, 2, 1 ]

=back

=over 4

=item C<meta>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=cut
