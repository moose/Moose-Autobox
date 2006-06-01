package Moose::Autobox::Undef;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Item';
            
sub defined { 0 }

1;