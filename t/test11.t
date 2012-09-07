#!/usr/bin/perl

# Tests the log file

use warnings;
use strict;
use lscp;
use Test::More tests => 3;
use Test::Files;

my $preprocessor = lscp->new;

$preprocessor->setOption("logLevel", "error");
$preprocessor->setOption("inPath", "t/in/test11");
$preprocessor->setOption("outPath", "t/out/test11");

$preprocessor->setOption("isCode", 0);
$preprocessor->setOption("numberOfThreads", 2);
$preprocessor->setOption("doOutputLogFile", 1);
$preprocessor->setOption("doLowerCase", 1);
$preprocessor->setOption("doStopwordsEnglish", 1);
$preprocessor->setOption("logFilePath", "t/out/test11/log.txt");


$preprocessor->preprocess();

compare_ok("t/out/test11/file1.txt", "t/oracle/test11/file1.txt", "file1.txt contents");
compare_ok("t/out/test11/file2.txt", "t/oracle/test11/file2.txt", "file2.txt contents");
compare_ok("t/out/test11/log.txt", "t/oracle/test11/log.txt", "log.txt contents");
