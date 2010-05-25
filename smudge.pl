#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  smudge.pl
#
#        USAGE:  ./smudge.pl  
#
#  DESCRIPTION:  Remove convidential data from text
#
#      OPTIONS:  ---
# REQUIREMENTS:  a file called smudge.regex
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Alec Clews (), alew.clews@voga.com.au
#      COMPANY:  Voga Consulting Services
#      VERSION:  1.0
#      CREATED:  23/05/10 07:54:54
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use Data::Dumper;
use IO::File;

# Read smudge.regex
my $file = "smudge.regex";
unless (my $return = do $file) {
    warn "couldn't parse $file: $@"         if $@;
    warn "couldn't do $file: $!"            unless defined $return;
    warn "couldn't run $file"               unless $return;
}

# Read smudge.values
my $valuesFile = "smudge.values";
unless (my $return = do $file) {
	my $values = {};
}


print Dumper(@main::smudge);
#print Dumper($main::values);


my $in = join('',<>); # slurp whole input



foreach my $s (@main::smudge) {
	if ($in =~ s/$s->{'regex'}/$s->{'replacement'}/moee) {

		foreach my $k (keys %{$s->{'save'}}) {
		no strict 'refs';
			$main::values->{$k} = ${$s->{'save'}->{$k}};
		use strict;
		print $in;
		}
	}
}


my $fh = new IO::File "> $valuesFile";
if (defined $fh) { 
	local $Data::Dumper::Purity = 1;
	print $fh Data::Dumper->Dump([$main::values], [qw(values)]);
	$fh->close;
}


# print $in;
