#!/usr/bin/perl
use strict;
use warnings;

# Install required modules if you haven't:
# on bash:
#cpan Spreadsheet::Read Excel::Writer::XLSX
#cpan Spreadsheet::ParseXLSX

use Spreadsheet::Read;
use Excel::Writer::XLSX;

# Read the existing spreadsheet
my $book = ReadData("input.xlsx");
my $sheet = $book->[1];  # First sheet

# Access a cell value (row 2, col 1 is A2)
my $cell_value = $sheet->{cell}[1][2];
print "Original A2 value: $cell_value\n";

# Create a new workbook to save changes
my $workbook  = Excel::Writer::XLSX->new('output.xlsx');
my $worksheet = $workbook->add_worksheet();

# Copy data and modify A2
for my $row (1 .. $sheet->{maxrow}) {
    for my $col (1 .. $sheet->{maxcol}) {
        my $value = $sheet->{cell}[$col][$row];

        # Modify A2 to "Updated!"
        if ($row == 2 && $col == 1) {
            $value = "Updated!";
        }

        $worksheet->write($row - 1, $col - 1, $value);
    }
}

print "Spreadsheet updated and saved to output.xlsx\n";
