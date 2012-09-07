#!/usr/bin/perl

# Tests removing email signatures

use warnings;
use strict;
use lscp;
use Test::More tests => 1;
use Test::Files;

my $preprocessor = lscp->new;

$preprocessor->setOption("logLevel", "error");
$preprocessor->setOption("inPath", "t/in/test8");
$preprocessor->setOption("outPath", "t/out/test8");

$preprocessor->setOption("isCode", 0);
$preprocessor->setOption("doRemoveEmailSignatures", 1);

$preprocessor->preprocess();

compare_ok("t/out/test8/file1.txt", "t/oracle/test8/file1.txt", "file1.txt contents");
