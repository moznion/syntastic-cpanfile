#!perl

use strict;
use warnings;
use utf8;
use Module::CPANfile;

my $cpanfile = $ARGV[0];
eval { Module::CPANfile->load($cpanfile) };
$@ or exit(0);
print format_errors($@);

sub format_errors {
    my ($raw_err_msg) = @_;

    my $err_type = 'E';    # <= Means ERROR
    my ( $err_text_ahead, $file_name, $line, $err_text_rear ) =
      $raw_err_msg =~ /failed: (.*) at (.*) line (\d+)(?:, |\.)?(.*)/;

    my $err_text = format_error_text( $err_text_ahead, $err_text_rear );

    return "$err_type;$file_name;$line;$err_text";
}

sub format_error_text {
    my ( $err_text_ahead, $err_text_rear ) = @_;

    $err_text_ahead ||= '';
    $err_text_rear  ||= '';

    my $formated = $err_text_ahead;
    $formated .= ": $err_text_rear" if $err_text_rear;
    return $formated;
}
