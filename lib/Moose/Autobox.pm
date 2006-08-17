
package Moose::Autobox;

use strict;
use warnings;

use Carp        qw(confess);
use Scalar::Util ();

our $VERSION = '0.03';

use base 'autobox';

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
        || confess "Can only add additional roles to SCALAR, ARRAY, HASH or CODE";
    ('Moose::Autobox::' . $type)->meta->_apply_all_roles($role);
}

{
                        
    package Moose::Autobox::SCALAR;
    # NOTE:
    # this doesnt make sense, but 
    # I need to prevent Moose from 
    # assiging to @ISA
    use base 'UNIVERSAL';
    use Moose;
    with 'Moose::Autobox::Scalar';

    *does = \&Moose::Object::does;

    package Moose::Autobox::ARRAY;
    use base 'UNIVERSAL';
    use Moose;
    with 'Moose::Autobox::Array';

    *does = \&Moose::Object::does;

    package Moose::Autobox::HASH;
    use base 'UNIVERSAL';
    use Moose;
    with 'Moose::Autobox::Hash';

    *does = \&Moose::Object::does;

    package Moose::Autobox::CODE;
    use base 'UNIVERSAL';
    use Moose;
    with 'Moose::Autobox::Code';  

    *does = \&Moose::Object::does;            
 
} 
                 
1;

__END__

=pod

=head1 NAME 

Moose::Autobox - Ruby ain't got nothin on us

=head1 SYNOPOSIS

  use Moose::Autobox;
  
  print 'Print squares from 1 to 10 : ';
  print [ 1 .. 10 ]->map(sub { $_ * $_ })->join(', ');

=head1 CAVEAT

First, a warning.

This module is very very very very very very very experimental. It 
makes use of a very experimental module (L<autobox>) and uses some 
shiney new technology (L<Moose::Role>) to accomplish it's goals.

Use this at your own risk. If it breaks the lamp in the living room
and your mother yells at you, don't come complaining to me.

Also, as this is so experimental, it's API should not be considered 
to be stable. It could very well change in radical ways.

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

My intent is to try and make this module as production worthy as 
possible. This may or may not be possible, depending on how well 
L<autobox> works out. At this point, I have high hopes for things
but only time (and more tests and code) will tell.

=head1 METHODS

=over 4

=item B<mixin_additional_role ($type, $role)>

This will mixin an additonal C<$role> into a certain C<$type>. The 
types can be SCALAR, ARRAY, HASH or CODE.

This can be used to add additional methods to the types, see the 
F<examples/units/> directory for some examples.

=back

=head1 TODO

=over 4

=item More docs

=item More tests

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
