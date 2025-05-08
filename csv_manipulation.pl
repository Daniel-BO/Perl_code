#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;

my $input_file  = 'input.csv';
my $output_file = 'output.csv';

my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });

open my $in,  '<', $input_file  or die "Cannot open $input_file: $!";
open my $out, '>', $output_file or die "Cannot open $output_file: $!";

my $row_num = 0;
while (my $row = $csv->getline($in)) {
    $row_num++;

    # Modify cell A2 (row 2, column 1, 0-based index [1][0])
    if ($row_num == 2) {
        $row->[0] = "Updated!";
    }

    $csv->print($out, $row);
    print $out "\n";
}

close $in;
close $out;

print "Updated CSV written to $output_file\n";
