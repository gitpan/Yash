#! /usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 3;

my $yaml_file = "t/example.yaml";
my $got;
my $expected;

$got = `./yash people -f $yaml_file`;
$expected = <<EOF;
---
deep:
  - Clark Evans
  - Oren Ben-Kiki
  - Ingy döt Net
EOF
is($got, $expected, "Getting a YAML dump of a hash");

ok(system ("./yash", "-f", $yaml_file, "--hash", "people", "deep"), "--hash returns 1 when a hash is not found");

ok(! system ("./yash", "-f", $yaml_file, "--hash", "people"), "--hash returns 1 when a hash is found");

