use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Moose::Autobox',
  AUTHOR        => 'Stevan Little <stevan@iinteractive.com>',
  VERSION_FROM  => 'lib/Moose/Autobox.pm',
  ABSTRACT_FROM => 'lib/Moose/Autobox.pm',
  LICENSE       => 'perl',
  PL_FILES      => {},
  PREREQ_PM     => {
    'autobox'         => '2.23',
    'parent'          => 0,
    'Moose'           => '0.42',
    'Syntax::Keyword::Junction' => 0,
  },
  TEST_REQUIRES => {
    'Test::More'      => '0.89',
    'Test::Exception' => '0.21',
  },
  META_MERGE        => {
    "meta-spec" => { version => 2 },
    resources => {
      repository => {
        type => 'git',
        url => 'https://github.com/moose/Moose-Autobox.git',
        web => 'https://github.com/moose/Moose-Autobox',
      },
    },
  },
  dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
  clean => { FILES => 'Moose-Autobox-*' },
);
