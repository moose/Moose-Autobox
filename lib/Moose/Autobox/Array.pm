package Moose::Autobox::Array;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Ref';

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
    CORE::join $sep, @$array; 
}

sub reverse { 
    my ($array) = @_;
    [ CORE::reverse @{$array} ];
}

sub sort { 
    my ($array, $sub) = @_;     
    $sub ||= sub { $a cmp $b }; 
    [ CORE::sort { $sub->($a, $b) } @$array ]; 
}

sub pop { 
    my ($array) = @_;    
    CORE::pop @{$array}; 
}

sub push { 
    my ($array, @rest) = @_;
    CORE::push @$array, @rest;  
    $array; 
}

sub unshift { 
    my ($array, @rest) = @_;    
    CORE::unshift @{$array}, @rest; 
    $array; 
}
sub exists {
    my ($array, $index) = @_;    
    CORE::exists $array->[$index];    
}

sub delete { 
    my ($array, $index) = @_;    
    CORE::delete $array->[$index];
}

sub shift { 
    my ($array) = @_;    
    CORE::shift @$array; 
}

1;
