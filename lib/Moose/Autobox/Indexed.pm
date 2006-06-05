package Moose::Autobox::Indexed;     
use Moose::Role 'requires';

our $VERSION = '0.01';

requires qw/exists keys values kv/;

1;