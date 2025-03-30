#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Map::Tube::Hannover' ) || print "Bail out!\n";
}

diag( "Testing Map::Tube::Hannover $Map::Tube::Hannover::VERSION, Perl $], $^X" );
