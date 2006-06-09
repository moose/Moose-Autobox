package Moose::Autobox::Hash;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Ref',
     'Moose::Autobox::Indexed';

sub delete { 
    my ($hash, $key) = @_;
    CORE::delete $hash->{$key}; 
}

# ::Indexed implementation

sub at {
    my ($hash, $index) = @_;
    $hash->{$index};
} 

sub put {
    my ($hash, $index, $value) = @_;
    $hash->{$index} = $value;
}

sub exists { 
    my ($hash, $key) = @_;
    CORE::exists $hash->{$key}; 
}

sub keys { 
    my ($hash) = @_;
    [ CORE::keys %$hash ];
}

sub values { 
    my ($hash) = @_;    
    [ CORE::values %$hash ]; 
}

sub kv {
    my ($hash) = @_;    
    [ CORE::map { [ $_, $hash->{$_} ] } CORE::keys %$hash ];    
}

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Hash - the Hash role

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;
  
  print { one => 1, two => 2 }->keys->join(', '); # prints 'one, two'

=head1 DESCRIPTION

This is a role to describes a Hash value. 

=head1 METHODS

=over 4

=item B<meta>

=item B<delete>

=back

=head2 Moose::Autobox::Indexed implementation

=over 4

=item B<at>

=item B<put>

=item B<exists>

=item B<keys>

=item B<values>

=item B<kv>

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