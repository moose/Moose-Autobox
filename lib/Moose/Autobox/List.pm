
package Moose::Autobox::List;
use Moose::Role 'with', 'requires';

our $VERSION = '0.01';

with 'Moose::Autobox::Value';

requires qw/
    length 
    join     
    grep map sort
    reverse
    reduce
    zip
/;


1;