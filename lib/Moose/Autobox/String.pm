package Moose::Autobox::String;
use Moose::Role;

our $VERSION = '0.01';

# perl built-ins

sub lc      { CORE::lc      $_[0] }
sub lcfirst { CORE::lcfirst $_[0] }
sub uc      { CORE::uc      $_[0] }
sub ucfirst { CORE::ucfirst $_[0] }
sub chomp   { CORE::chomp   $_[0] }
sub chop    { CORE::chop    $_[0] }
sub reverse { CORE::reverse $_[0] }
sub length  { CORE::length  $_[0] }
sub index   { CORE::index   $_[0], $_[1], (defined $_[2] ? $_[2] : ()) }

# FIXME: this is not working 
#sub rindex  { CORE::rindex  $_[0], $_[1], (defined $_[2] ? $_[2] : ()) }
     
1;