#!/usr/bin/perl
use strict;
use warnings;
use Test;
BEGIN {plan tests => 20};
use PAR::WebStart;
use PAR::WebStart::PNLP;
use Cwd;
require File::Spec;
my $cwd = getcwd;
my $file = File::Spec->catfile($cwd, 't', 'hello.pnlp');
ok(-e $file);
my $obj = PAR::WebStart->new(file => $file);
ok($obj->isa('PAR::WebStart'));
my $cfg = $obj->{cfg};
ok($cfg);
ok($cfg->{pnlp}->{spec}, '0.1');
ok($cfg->{pnlp}->{codebase}, 'http://localhost/perlwebstart/apps');
ok($cfg->{pnlp}->{href}, 'hello.pnlp');
ok($cfg->{information}->{seen}, 1);
ok($cfg->{title}->{value}, 'Hello App');
ok($cfg->{vendor}->{value}, 'Some Vendor');
ok($cfg->{homepage}->{href}, 'http://localhost/perlwebstart/demos.html');
ok($cfg->{description}->[0]->{value}, 'Hello Demo Description');
ok($cfg->{perlws}->{version}, '0.1');
ok($cfg->{'application-desc'}->{'main-par'}, 'A');

my $par_ref = $cfg->{par};
ok(scalar(@$par_ref), 2);
ok($par_ref->[0]->{href}, 'A.par');
ok($par_ref->[1]->{href}, 'C.par');

my $arg_ref = $cfg->{argument};
ok(scalar(@$arg_ref), 3);
ok($arg_ref->[0]->{value}, 'one');
ok($arg_ref->[1]->{value}, '-two');
ok($arg_ref->[2]->{value}, 'three');
