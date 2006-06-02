
package Moose::Autobox::List;
use Moose::Role 'with', 'requires';

our $VERSION = '0.01';

with 'Moose::Autobox::Value';

requires qw/length grep map join reverse sort/;

1;