#! /usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 3;

my $yaml_file = "t/example.yaml";
my $got;
my $expected;

$got = `./yash 'favorite colors' -f $yaml_file`;
$expected = <<EOF;
---
- red
- green
- blue
EOF
is($got, $expected, "Getting a YAML dump of an array");

ok(! system ("./yash", "-f", $yaml_file, "--array", "people", "deep"), "--array returns 0 when a hash is found");

ok(system ("./yash", "-f", $yaml_file, "--array", "name"), "--array returns 1 when a hash is not found");

