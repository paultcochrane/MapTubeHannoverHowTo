use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
    NAME             => 'Map::Tube::Hannover',
    AUTHOR           => q{Paul Cochrane <ptc@cpan.org>},
    VERSION_FROM     => 'lib/Map/Tube/Hannover.pm',
    ABSTRACT_FROM    => 'lib/Map/Tube/Hannover.pm',
    LICENSE          => 'artistic_2',
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    TEST_REQUIRES => {
        'Test::More'      => '0',
        'Test::Map::Tube' => '4.03',
    },
    PREREQ_PM => {
        'File::Share' => '0',
        'Map::Tube'   => '4.03',
        'Moo'         => '0',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Map-Tube-Hannover-*' },
    # rest of %WriteMakefileArgs content
    META_MERGE => {
        "meta-spec" => { version => 2 },
        prereqs => {
            test => {
                recommends => {
                    'Test::CheckManifest' => '0.9',
                    'Test::Pod::Coverage' => '1.08',
                    'Test::Pod' => '1.22',
                },
            },
        },
    },
);

# Compatibility with old versions of ExtUtils::MakeMaker
unless (eval { ExtUtils::MakeMaker->VERSION('6.64'); 1 }) {
    my $test_requires = delete $WriteMakefileArgs{TEST_REQUIRES} || {};
    @{$WriteMakefileArgs{PREREQ_PM}}{keys %$test_requires} = values %$test_requires;
}

unless (eval { ExtUtils::MakeMaker->VERSION('6.55_03'); 1 }) {
    my $build_requires = delete $WriteMakefileArgs{BUILD_REQUIRES} || {};
    @{$WriteMakefileArgs{PREREQ_PM}}{keys %$build_requires} = values %$build_requires;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
    unless eval { ExtUtils::MakeMaker->VERSION('6.52'); 1 };
delete $WriteMakefileArgs{MIN_PERL_VERSION}
    unless eval { ExtUtils::MakeMaker->VERSION('6.48'); 1 };
delete $WriteMakefileArgs{LICENSE}
    unless eval { ExtUtils::MakeMaker->VERSION('6.31'); 1 };

WriteMakefile(%WriteMakefileArgs);
