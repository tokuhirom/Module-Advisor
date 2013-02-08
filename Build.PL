use strict;
use warnings;
use Module::Build;

if (-d '.git') {
    system("perl author/docgen.pl > lib/Module/Advisor.pod");
}

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
        'Test::Requires' => 0,
    },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        # 'Exporter'                      => '0',
        'parent'                        => '0',
        'CPAN::Meta::Requirements' => '2.122',
        'Module::Metadata'         => '1.000000',
        perl => '5.008008',
        # 'Plack'                         => '0.9949',
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Module-Advisor',
    module_name => 'Module::Advisor',

    # script_files => [''],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
   
    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
