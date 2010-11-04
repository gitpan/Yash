use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    dist_name      => 'Yash',
    dist_version   => '0.2',
    dist_abstract  => 'Manipulation of Yaml files in shell scripts',
    license        => 'perl',
    dist_author    => 'Olivier Schwander <iderrick@cpan.org>',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'YAML' => 0,
    },
    script_files => ['yash'],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();

