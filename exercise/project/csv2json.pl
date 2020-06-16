#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;
use JSON;

my @rows;
my $people = [];
my $file = $ARGV[0] or die "Please specify a CSV file as the argument to this script.";

# Read the CSV and make our person structures
my $csv = Text::CSV->new({binary => 1});
open my $fh, "<:encoding(utf8)", $file or die "Error reading $file: $!";
while (my $row = $csv->getline($fh)) {
    my @date = split(/\s+/, $row->[0]);
    my @name = split(/\|/, $row->[1]);
    print STDERR "@name\n";
    my $desc = $row->[2];
    my $born = $row->[3];
    my $link = $name[0];
    $link =~ s/\s+/_/g;
    my $person = {
        link => 'https://en.wikipedia.org/wiki/' . $link,
        name => scalar(@name) > 1 ? $name[1] : $name[0],
        day => $date[1],
        month => $date[0],
        profession => $desc,
        birthyear => $born
    };
    push(@$people, $person);
}

# Spit the person structures to STDOUT
my $json = JSON->new->allow_nonref;
print $json->pretty->encode($people);
