package Moose::Autobox::Array;
use Moose::Role 'with';
use Perl6::Junction;
use Moose::Autobox;

our $VERSION = '0.03';

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

sub slice {
    my ($array, $indicies) = @_;
    [ @{$array}[ @{$indicies} ] ];
} 

# NOTE: 
# sprintf args need to be reversed, 
# because the invocant is the array
sub sprintf { CORE::sprintf $_[1], @{$_[0]} }

## ::List interface implementation

sub head { $_[0]->[0] }
sub tail { [ @{$_[0]}[ 1 .. $#{$_[0]} ] ] }
 
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

## ::Indexed implementation

sub at {
    my ($array, $index) = @_;
    $array->[$index];
} 

sub put {
    my ($array, $index, $value) = @_;
    $array->[$index] = $value;
}

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

## Junctions

sub all {
    my ($array) = @_;     
    return Perl6::Junction::All->all(@$array);
}

sub any {
    my ($array) = @_;     
    return Perl6::Junction::Any->any(@$array);
}

sub none {
    my ($array) = @_;     
    return Perl6::Junction::None->none(@$array);
}

sub one {
    my ($array) = @_; 
    return Perl6::Junction::One->one(@$array);
}

## Print

sub print { CORE::print @{$_[0]} }
sub say   { CORE::print @{$_[0]}, "\n" }

1;

__END__

=pod

=head1 NAME 

Moose::Autobox::Array - the Array role

=head1 SYNOPOSIS

  use Moose::Autobox;
    
  [ 1..5 ]->isa('ARRAY'); # true
  [ a..z ]->does('Moose::Autobox::Array'); # true
  [ 0..2 ]->does('Moose::Autobox::List'); # true  
    
  print "Squares: " . [ 1 .. 10 ]->map(sub { $_ * $_ })->join(', ');
  
  print [ 1, 'number' ]->sprintf('%d is the loneliest %s');
  
  print ([ 1 .. 5 ]->any == 3) ? 'true' : 'false'; # prints 'true'

=head1 DESCRIPTION

This is a role to describe operations on the Array type. 

=head1 METHODS

=over 4

=item B<pop>

=item B<push ($value)>

=item B<shift>

=item B<unshift ($value)>

=item B<delete ($index)>

=item B<sprintf ($format_string)>

=item B<slice (@indices)>

=back

=head2 Indexed implementation

=over 4

=item B<at ($index)>

=item B<put ($index, $value)>

=item B<exists ($index)>

=item B<keys>

=item B<values>

=item B<kv>

=back

=head2 List implementation

=over 4

=item B<head>

=item B<tail>

=item B<join (?$seperator)>

=item B<length>

=item B<map (\&block)>

=item B<grep (\&block)>

=item B<reverse>

=item B<sort (?\&block)>

=back

=head2 Junctions

=over 4

=item B<all>

=item B<any>

=item B<none>

=item B<one>

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

=head1 COPYRIGHT AND LICENSE

Copyright 2006-2008 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
