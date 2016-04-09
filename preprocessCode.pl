#!/usr/bin/perl

# Tests comment extraction

use warnings;
use strict;
use lscp;
use Test::More tests => 1;
use Test::Files;

my $num_args = $#ARGV + 1;

if ($num_args != 2) {
    print "\nUsage: preprocessCode.pl input_file_dir output_file_dir\n";
    exit;
}

my ($input_dir, $output_dir) = @ARGV;

my $preprocessor = lscp->new;

$preprocessor->setOption("logLevel", "error");
$preprocessor->setOption("inPath", $input_dir);
$preprocessor->setOption("outPath", $output_dir);

$preprocessor->setOption("isCode", 1);
#$preprocessor->setOption("doIdentifiers", 0);
$preprocessor->setOption("doIdentifiers", 1);
#$preprocessor->setOption("doStringLiterals", 0);
$preprocessor->setOption("doStringLiterals", 1);
$preprocessor->setOption("doComments", 1);
#$preprocessor->setOption("doTokenize", 0);
$preprocessor->setOption("doTokenize", 1);
#$preprocessor->setOption("doStemming", 0);
$preprocessor->setOption("doStemming", 1);
#$preprocessor->setOption("doRemoveDigits", 0);
$preprocessor->setOption("doRemoveDigits", 1);
$preprocessor->setOption("doRemovePunctuation", 1);
$preprocessor->setOption("doRemoveSmallWords", 1);
$preprocessor->setOption("smallWordSize", 3);
$preprocessor->setOption("doLowerCase", 0);
#$preprocessor->setOption("doLowerCase", 1);
#$preprocessor->setOption("doStopwordsKeywords", 0);
$preprocessor->setOption("doStopwordsKeywords", 1);
$preprocessor->setOption("doStopwordsEnglish", 1);
#$preprocessor->setOption("doRemoveEmailAddresses", 1);
#x$preprocessor->setOption("doRemoveURLs", 1);

$preprocessor->preprocess();

#compare_ok("t/out/test001/file1.java", "t/oracle/test001/file1.java", "file1.java contents");
