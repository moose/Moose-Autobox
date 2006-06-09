package Moose::Autobox::Value;     
use Moose::Role 'with', 'requires';

our $VERSION = '0.01';

with 'Moose::Autobox::Defined';

sub do { 
    my ($self, $block) = @_;
    local $_ = $self;
    $block->($self);
}

1;
__END__

=pod

=head1 NAME 

Moose::Autobox::Value - the Value role

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;
  
  5->print; # prints 5
  
  # excute a sub on the value
  10->do(sub { $_ + 15 })->print; # prints 25

=head1 DESCRIPTION

=head1 METHODS

=over 4

=item B<meta>

=item B<do>

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
