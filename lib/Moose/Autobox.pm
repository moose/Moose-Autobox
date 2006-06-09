
package Moose::Autobox;

use strict;
use warnings;

use Carp        qw(confess);
use Scalar::Util ();

our $VERSION = '0.01';
            
#sub import {
#    eval q|
package SCALAR;

# NOTE:
# this doesnt make sense, but 
# I need to prevent Moose from 
# assiging to @ISA
use base 'Moose::Autobox';

use Moose;
with 'Moose::Autobox::Scalar';

*does = \&Moose::Object::does;

package ARRAY;
use base 'Moose::Autobox';
use Moose;
with 'Moose::Autobox::Array';

*does = \&Moose::Object::does;

package HASH;
use base 'Moose::Autobox';
use Moose;
with 'Moose::Autobox::Hash';

*does = \&Moose::Object::does;

package CODE;
use base 'Moose::Autobox';
use Moose;
with 'Moose::Autobox::Code';  

*does = \&Moose::Object::does;
  
#    |;
#    confess 'Could not create autobox packages because - ' . $@ if $@;
#}               

1;

__END__

=pod

=head1 NAME 

Moose::Autobox - autoboxed for her pleasure

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;
  
  'Print squares from 1 to 10'->print;  
  [ 1 .. 10 ]->map(sub { $_ * $_ })->join(', ')->print;

=head1 DESCRIPTION

=head1 ROLES

  Item                  |
      Undef             |
      Defined           |
          Scalar*     <-|- String, Number <--+
          Ref           |                    |-- Value 
              Array*  <-|- List <------------+
              Hash*     |
              Code*     |
                      
  * indicates actual autoboxed types
  
=head1 NOTES  
  
  - String, Number & List are currently the only Values.
  
  - Indexed is pretty much an interface, we probably will 
    need more of these (see Smalltalk Collection Trait 
    Refactoring)
  
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
