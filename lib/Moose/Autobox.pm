
package Moose::Autobox;

use strict;
use warnings;

use Moose        qw(confess);
use Scalar::Util ();

our $VERSION = '0.01';
            
sub import {
    eval q|
package SCALAR;
use Moose;
with 'Moose::Autobox::Scalar';

package ARRAY;
use Moose;
with 'Moose::Autobox::Array';

package HASH;
use Moose;
with 'Moose::Autobox::Hash';

package CODE;
use Moose;
with 'Moose::Autobox::Code';    
    |;
    confess 'Could not create autobox packages because - ' . $@ if $@;
}               

1;

__END__

=pod

=head1 NAME 

Moose::Autobox - autoboxed for her pleasure

=head1 SYNOPOSIS

=head1 DESCRIPTION

  Any
  Item 
      Bool
      Undef
      Defined
          Value
              Num
                Int
              Str
          Ref
              ScalarRef
              ArrayRef
              HashRef
              CodeRef
              RegexpRef
              Object	
                  Role
  

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


