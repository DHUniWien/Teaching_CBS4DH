#!/usr/bin/perl

use strict;
use warnings;

my $currdate = '';
while(<>) {
	my $skip = 0;
	if (/^\*\s+\[\[(.*?)\]\]\s*$/) {
		$currdate = $1;
		$skip = 1;
	} elsif (/^\*\*/) {
		s/^\*\*/\* [[$currdate]] &ndash;/;
	}
	print unless $skip;
}
