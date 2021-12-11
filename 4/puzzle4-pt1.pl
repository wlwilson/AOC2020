#!/usr/bin/perl

use Data::Dumper;

undef $/;
$/="";
open my $handle, '<', "/home/willy/AOC/4/input";
chomp(my @lines = <$handle>);
close $handle;
my $validCnt=0;

for my $line (@lines) {
    #my @fields=split(/[\s,:,\n]/,$line);
    my @fields=split(/[\s,\n]/,$line);
    print(Dumper(@fields));
    #if ( ($#fields == 15) || ( $#fields == 13 && !(grep(/^cid/,@fields)))) {
    if ( ($#fields == 7) || ( $#fields == 6 && !(grep(/^cid/,@fields)))) {
       print "valid passport\n";
       $validCnt++;
    }
    print("$#fields\n");
}

print("$validCnt\n");
