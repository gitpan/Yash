#! /usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 4;

my $yaml_file = "t/example.yaml";
my $got;

$got = `./yash name -f $yaml_file`;
chomp $got;
is($got, "ingy", "Loading from file");

$got = `./yash name < $yaml_file`;
chomp $got;
is($got, "ingy", "Getting a value from a hash");

ok(! system ("./yash", "-f", $yaml_file, "--scalar", "people", "deep", "0"), "--scalar returns 0 when a scalar was found");

ok(system ("./yash", "-f", $yaml_file, "--scalar", "people", "deep"), "--scalar returns 1 when a scalar was not found");

