package Moose::Autobox::Scalar;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Value',
     'Moose::Autobox::String';

# ::Value requirement     
     
sub print { CORE::print $_[0] }
     
1;