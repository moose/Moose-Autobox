package Moose::Autobox::Hash;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Ref';

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