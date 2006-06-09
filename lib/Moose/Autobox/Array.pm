package Moose::Autobox::Array;
use Moose::Role 'with';
use autobox;

our $VERSION = '0.01';

with 'Moose::Autobox::Ref',
     'Moose::Autobox::List',
     'Moose::Autobox::Indexed';
    
## Array Interface

sub pop { 
    my ($array) = @_;    
    CORE::pop @$array; 
}

sub push { 
    my ($array, @rest) = @_;
    CORE::push @$array, @rest;  
    $array; 
}

sub unshift { 
    my ($array, @rest) = @_;    
    CORE::unshift @$array, @rest; 
    $array; 
}

sub delete { 
    my ($array, $index) = @_;    
    CORE::delete $array->[$index];
}

sub shift { 
    my ($array) = @_;    
    CORE::shift @$array; 
}     

# NOTE: 
# sprintf args need to be reversed, 
# because the invocant is the array
sub sprintf { CORE::sprintf $_[1], @{$_[0]} }

## ::List interface implementation

sub head { $_[0]->[0] }
sub tail { [ @{$_[0]}[ 1 .. $#{$_[0]} ] ] }
 
sub at {
    my ($array, $index) = @_;
    $array->[$index];
} 

sub put {
    my ($array, $index, $value) = @_;
    $array->[$index] = $value;
}
 
sub length {
    my ($array) = @_;
    CORE::scalar @$array;
}

sub grep { 
    my ($array, $sub) = @_; 
    [ CORE::grep { $sub->($_) } @$array ]; 
}

sub map { 
    my ($array, $sub) = @_; 
    [ CORE::map { $sub->($_) } @$array ]; 
}

sub join { 
    my ($array, $sep) = @_;    
    $sep ||= ''; 
    CORE::join $sep, @$array; 
}

sub reverse { 
    my ($array) = @_;
    [ CORE::reverse @$array ];
}

sub sort { 
    my ($array, $sub) = @_;     
    $sub ||= sub { $a cmp $b }; 
    [ CORE::sort { $sub->($a, $b) } @$array ]; 
}    

# ::Value requirement

sub print { CORE::print @{$_[0]} }

## ::Indexed implementation

sub exists {
    my ($array, $index) = @_;    
    CORE::exists $array->[$index];    
}

sub keys { 
    my ($array) = @_;    
    [ 0 .. $#{$array} ];
}

sub values { 
    my ($array) = @_;    
    [ @$array ];
}

sub kv {
    my ($array) = @_;   
    $array->keys->map(sub { [ $_, $array->[$_] ] });
}

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Array - the Array role

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;
    
  print "Squares: " . [ 1 .. 10 ]->map(sub { $_ * $_ })->join(', ');

=head1 DESCRIPTION

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