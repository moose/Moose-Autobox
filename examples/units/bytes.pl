#!/usr/bin/perl

use strict;
use warnings;

use Moose::Autobox;

{
    package # hide from PAUSE
        Units::Bytes;
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

Moose::Autobox->mixin_additional_role(SCALAR => 'Units::Bytes');

$\ = "\n";

print "5 kilobytes are " . 5->kilobytes . " bytes";
print "2 megabytes are " . 2->megabytes . " bytes";
print "1 gigabyte is "   . 1->gigabyte  . " bytes";
print "2 terabyes are "  . 2->terabytes . " bytes";

=pod

=head1 NAME

Unit::Bytes

=head1 SYNOPSIS

  Moose::Autobox->mixin_additional_role(SCALAR => 'Units::Bytes');

  print "5 kilobytes are " . 5->kilobytes . " bytes";
  print "2 megabytes are " . 2->megabytes . " bytes";
  print "1 gigabyte is "   . 1->gigabyte  . " bytes";
  print "2 terabyes are "  . 2->terabytes . " bytes";

=head1 DESCRIPTION

This is a Moose::Autobox port of the perl6 vmethods example.

=head1 AUTHOR

Stevan Little, E<lt>stevan@iinteractive.comE<gt>

=head1 ACKNOLEDGEMENTS

This code was ported from the version in the Pugs
examples/vmethods/ directory. See that for original author
information.

=cut
