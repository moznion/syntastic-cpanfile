#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Module::CPANfile;

my $file = $ARGV[0];
eval { Module::CPANfile->load($file) };

$@ or exit(0);
my $res = $@;

my $type = 'E';    # <= Means Error
my ( $err_msg_before, $file_name, $line, $err_msg_after ) =
  $res =~ /failed: (.*) at (.*) line (\d*)(?:, |\.)?(.*)/;

$err_msg_before = $err_msg_before || '';
$err_msg_after  = $err_msg_after  || '';

my $err_msg = 'syntax error: ';
if ( $err_msg_before && $err_msg_after ) {
    $err_msg .= "$err_msg_before, $err_msg_after";
}
else {
    $err_msg .= "$err_msg_before$err_msg_after";
}

print "$type;$file_name;$line;$err_msg";
