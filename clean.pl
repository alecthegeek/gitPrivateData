#!/usr/bin/env perl 
#===============================================================================
#
#         FILE:  clean.pl
#
#        USAGE:  ./clean.pl  
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Alec Clews (), alew.clews@voga.com.au
#      COMPANY:  Voga Consulting Services
#      VERSION:  1.0
#      CREATED:  25/05/10 23:14:07
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use Template;


my $file = "smudge.values";
unless (my $return = do $file) {
    warn "couldn't parse $file: $@"         if $@;
    warn "couldn't do $file: $!"            unless defined $return;
    warn "couldn't run $file"               unless $return;
}



my $tt = Template->new({
        INCLUDE_PATH => '/usr/local/templates',
        INTERPOLATE  => 1,
    }) || die "$Template::ERROR\n";


$tt->process(\*STDIN, $main::values)
        || die $tt->error();
