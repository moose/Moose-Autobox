#!/usr/bin/perl

use strict;
use warnings;

use Moose::Autobox;

{
    package # hide me from PAUSE
        Units::Time;
    use Moose::Role;
    use Moose::Autobox;

    sub seconds   { $_[0]               }
    sub minutes   { $_[0] * 60          }
    sub hours     { $_[0] * 60->minutes }
    sub days      { $_[0] * 24->hours   }
    sub weeks     { $_[0] * 7->days     }
    sub years     { $_[0] * 365->days   }
    sub centuries { $_[0] * 10->years   }

    sub ago {
        my ($self, $time) = @_;
        $time ||= time();
        $time - $self;
    }

    sub since {
        my ($self, $time) = @_;
        $time ||= time();
        $time + $self;
    }

    {
        no warnings 'once';

        # singular versions
        *second  = \&seconds;
        *minute  = \&minutes;
        *hour    = \&hours;
        *day     = \&days;
        *week    = \&weeks;
        *year    = \&years;
        *century = \&centuries;

        *til      = \&ago;
        *from_now = \&since;
    }

    sub as_string { scalar localtime $_[0] }

}

Moose::Autobox->mixin_additional_role(SCALAR => 'Units::Time');

$\ = "\n";

print "2 days ago was           : " . 2->days->ago->as_string;
print "3 weeks from now will be : " . 3->weeks->from_now->as_string;
my $one_week_ago = 1->week->ago;
print "1 day until 1 week ago   : " . 1->day->til($one_week_ago)->as_string;
print "2 years since 1 week ago : " . 2->years->since($one_week_ago)->as_string;

=pod

=head1 NAME

Unit::Time

=head1 SYNOPSIS

  Moose::Autobox->mixin_additional_role(SCALAR => 'Units::Time');

  print "2 days ago was           : " . 2->days->ago->as_string;
  print "3 weeks from now will be : " . 3->weeks->from_now->as_string;
  print "1 day until 1 week ago   : " . 1->day->til(1->week->ago)->as_string;
  print "2 years since 1 week ago : " . 2->years->since(1->week->ago)->as_string;

=head1 DESCRIPTION

This is a Moose::Autobox port of the perl6 vmethods example.

=head1 AUTHOR

Stevan Little, E<lt>stevan@iinteractive.comE<gt>

=head1 ACKNOWLEDGEMENTS

This code was ported from the version in the Pugs
examples/vmethods/ directory. See that for original author
information.

=cut
