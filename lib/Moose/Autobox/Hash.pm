package Moose::Autobox::Hash;
use Moose::Role 'with';

use Carp qw(croak);

our $VERSION = '0.02';

with 'Moose::Autobox::Ref',
     'Moose::Autobox::Indexed';

sub delete { 
    my ($hash, $key) = @_;
    CORE::delete $hash->{$key}; 
}

sub merge {
    my ($left, $right) = @_;
    croak "You must pass a hashref as argument to merge"
        unless ref $right eq 'HASH';
    return { %$left, %$right };
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

sub print   { CORE::print %{$_[0]} }
sub say     { CORE::print %{$_[0]}, "\n" }

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Hash - the Hash role

=head1 SYNOPOSIS

  use Moose::Autobox;
  
  print { one => 1, two => 2 }->keys->join(', '); # prints 'one, two'

=head1 DESCRIPTION

This is a role to describes a Hash value. 

=head1 METHODS

=over 4

=item B<delete>

=item B<merge>

Takes a hashref and returns a new hashref with right precedence
shallow merging.

=back

=head2 Indexed implementation

=over 4

=item B<at>

=item B<put>

=item B<exists>

=item B<keys>

=item B<values>

=item B<kv>

=back

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

Anders Nor Berle E<lt>debolaz@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

