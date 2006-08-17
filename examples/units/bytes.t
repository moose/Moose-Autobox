#!/usr/bin/perl

use strict;
use warnings;

use Moose::Autobox;

{
    package Units::Bytes;
    use Moose::Role;
    use Moose::Autobox;
    
    sub bytes     { $_[0]                   }    
    sub kilobytes { $_[0] * 1024            }
    sub megabytes { $_[0] * 1024->kilobytes }
    sub gigabytes { $_[0] * 1024->megabytes }
    sub terabytes { $_[0] * 1024->gigabytes }
    
    {
        no warnings 'once'; # << squelch the stupid "used only once, maybe typo" warnings
        *byte     = \&bytes;
        *kilobyte = \&kilobytes;    
        *megabyte = \&megabytes;    
        *gigabyte = \&gigabytes;
        *terabyte = \&terabytes;
    }
}

{
    package Moose::Autobox::SCALAR;
    use Moose 'with';
    with 'Units::Bytes';
}

$\ = "\n";

print "5 kilobytes are " . 5->kilobytes . " bytes";
print "2 megabytes are " . 2->megabytes . " bytes";
print "1 gigabyte is "   . 1->gigabyte  . " bytes";
print "2 terabyes are "  . 2->terabytes . " bytes";

