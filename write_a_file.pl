#Writing to a file
#!/usr/bin/perl
select STDERR; $|=1;
select STDOUT; $|=1;

use strict;
use warnings;
use Path::Tiny;
use autodie; # die if problem reading or writing a file

my $dir = path("/home/DanielBO/Documents"); # path where you will create the file

my $file = $dir->child("DanielB.txt"); # /path/file.txt

# Get a file_handle (IO::File object) you can write to
# with a UTF-8 encoding layer
my $file_handle = $file->openw_utf8();

my @list = ('a', 'list', 'of', 'lines');

foreach my $line ( @list ) {
    # Add the line to the file
    $file_handle->print($line . "\n");
}
