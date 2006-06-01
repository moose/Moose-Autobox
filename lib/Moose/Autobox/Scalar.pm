package Moose::Autobox::Scalar;
use Moose::Role 'with';

our $VERSION = '0.01';

with 'Moose::Autobox::Value', 
     'Moose::Autobox::Ref';
     
1;