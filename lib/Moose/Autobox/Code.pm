package Moose::Autobox::Code;
use Moose::Role 'with';
use autobox;

our $VERSION = '0.01';

with 'Moose::Autobox::Ref';

sub curry {
    my ($f, @a) = @_;
    return sub { $f->(@a, @_) }
}

sub rcurry {
    my ($f, @a) = @_;
    return sub { $f->(@_, @a) }
}

sub compose {
	my ($f, $f2, @rest) = @_;
    return $f if !$f2;
    return (sub { $f2->($f->(@_)) })->compose(@rest);
}

sub disjoin {
    my ($f, $f2) = @_;
    return sub { $f->(@_) || $f2->(@_) }
}
        
sub conjoin {
	my ($f, $f2) = @_;
	return sub { $f->(@_) && $f2->(@_) }    
}

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Code - the Code role

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;
  
  my $adder = sub { $_[0] + $_[1] };
  
  $add_2 = $adder->curry(2);
  
  $add_2->(2); # returns 4

=head1 DESCRIPTION

This is a role to describe operations on the Code type. 

=head1 METHODS

=over 4

=item B<meta>

=item B<curry>

=item B<rcurry>

=item B<conjoin>

=item B<disjoin>

=item B<compose>

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