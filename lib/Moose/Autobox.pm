package Moose::Autobox;
# ABSTRACT: Autoboxed wrappers for Native Perl datatypes
use 5.006;
use strict;
use warnings;

use Carp ();
use Scalar::Util ();
use Moo::Role  2.000 ();

our $VERSION = '0.16';

use parent 'autobox';

use Moose::Autobox::Undef;

sub import {
    (shift)->SUPER::import(
        DEFAULT => 'Moose::Autobox::',
        UNDEF   => 'Moose::Autobox::Undef',
    );
}

sub mixin_additional_role {
    my ($class, $type, $role) = @_;
    ($type =~ /SCALAR|ARRAY|HASH|CODE/)
        || Carp::confess "Can only add additional roles to SCALAR, ARRAY, HASH or CODE";
    Moo::Role->apply_roles_to_package('Moose::Autobox::' . $type, $role);
}

{
    package
      Moose::Autobox::SCALAR;

    use Moose::Autobox::Scalar;

    Moo::Role->apply_roles_to_package(__PACKAGE__,'Moose::Autobox::Scalar');

    package
      Moose::Autobox::ARRAY;

    use Moose::Autobox::Array;

    Moo::Role->apply_roles_to_package(__PACKAGE__,'Moose::Autobox::Array');

    package
      Moose::Autobox::HASH;

    use Moose::Autobox::Hash;

    Moo::Role->apply_roles_to_package(__PACKAGE__,'Moose::Autobox::Hash');

    package
      Moose::Autobox::CODE;

    use Moose::Autobox::Code;

    Moo::Role->apply_roles_to_package(__PACKAGE__,'Moose::Autobox::Code');
}

1;
__END__

=pod

=for :header
=for :stopwords Autoboxed autobox

=head1 SYNOPSIS

  use Moose::Autobox;

  print 'Print squares from 1 to 10 : ';
  print [ 1 .. 10 ]->map(sub { $_ * $_ })->join(', ');

=head1 DESCRIPTION

Moose::Autobox provides an implementation of SCALAR, ARRAY, HASH
& CODE for use with L<autobox>. It does this using a hierarchy of
roles in a manner similar to what Perl 6 I<might> do. This module,
like L<Class::MOP> and L<Moose>, was inspired by my work on the
Perl 6 Object Space, and the 'core types' implemented there.

=head2 A quick word about autobox

The L<autobox> module provides the ability for calling 'methods'
on normal Perl values like Scalars, Arrays, Hashes and Code
references. This gives the illusion that Perl's types are first-class
objects. However, this is only an illusion, albeit a very nice one.
I created this module because L<autobox> itself does not actually
provide an implementation for the Perl types but instead only provides
the 'hooks' for others to add implementation too.

=head2 Is this for real? or just play?

Several people are using this module in serious applications and
it seems to be quite stable. The underlying technologies of L<autobox>
and L<Moose::Role> are also considered stable. There is some performance
hit, but as I am fond of saying, nothing in life is free.  Note that this hit
only applies to the I<use> of methods on native Perl values, not the mere act
of loading this module in your namespace.

If you have any questions regarding this module, either email me, or stop by
#moose on irc.perl.org and ask around.

=head2 Adding additional methods

B<Moose::Autobox> asks L<autobox> to use the B<Moose::Autobox::*> namespace
prefix so as to avoid stepping on the toes of other L<autobox> modules. This
means that if you want to add methods to a particular perl type
(i.e. - monkeypatch), then you must do this:

  sub Moose::Autobox::SCALAR::bar { 42 }

instead of this:

  sub SCALAR::bar { 42 }

as you would with vanilla autobox.

=head1 METHODS

=over 4

=item C<mixin_additional_role ($type, $role)>

This will mixin an additional C<$role> into a certain C<$type>. The
types can be SCALAR, ARRAY, HASH or CODE.

This can be used to add additional methods to the types, see the
F<examples/units/> directory for some examples.

=back

=for :stopwords TODO

=head1 TODO

=over 4

=item More docs

=item More tests

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=cut
