package Moose::Autobox::Defined;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Item';
            
sub defined { 1 }

sub do { 
    my ($self, $block) = @_;
    local $_ = $self;
    $block->($self);
}

1;