use strict;
use warnings;
use inc::Module::Install;

name('Moose-Autobox');
all_from('lib/Moose/Autobox.pm');

requires 'autobox'         => '2.23';
requires 'Moose'           => '0.42';
requires 'Perl6::Junction' => '1.10';

test_requires 'Test::More'      => '0.62';
test_requires 'Test::Exception' => '0.21';

tests_recursive;

WriteAll;
