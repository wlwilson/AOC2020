#!/usr/bin/perl

use Data::Dumper;
use List::MoreUtils qw(uniq);
undef $/;
$/="";
open my $handle, '<', "/home/willy/AOC/6/input";
chomp(my @lines = <$handle>);
close $handle;
my $sumAnswers = 0;

foreach $chunk ( @lines ){
    my @chars = split(//,$chunk);
    @chars = grep(!/\n/,@chars);
    @chars1=uniq @chars;
    #print ( Dumper(@chars));
    #print("\n");
    $sumAnswers = ($#chars1+1) + $sumAnswers;
    
}

print("Total: $sumAnswers\n");
