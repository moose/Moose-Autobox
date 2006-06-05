package Moose::Autobox::Value;     
use Moose::Role 'with', 'requires';

our $VERSION = '0.01';

with 'Moose::Autobox::Defined';

requires 'print';

sub do { 
    my ($self, $block) = @_;
    local $_ = $self;
    $block->($self);
}

1;