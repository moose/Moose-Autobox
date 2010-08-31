use strict;
use warnings;
use inc::Module::Install 0.96;
use Module::Install::AutoManifest;
use Module::Install::ExtraTests;

name('Moose-Autobox');
all_from('lib/Moose/Autobox.pm');

requires 'autobox'         => '2.23';
requires 'Moose'           => '0.42';
requires 'Perl6::Junction' => '1.40000';

test_requires 'Test::More'      => '0.89';
test_requires 'Test::Exception' => '0.21';

repository 'git://git.moose.perl.org/Moose-Autobox.git';

auto_manifest;
tests_recursive;
extra_tests;

WriteAll;
