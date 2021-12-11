#!/usr/bin/perl

use Data::Dumper;

open my $handle, '<', "/home/willy/AOC/3/input";
chomp(my @lines = <$handle>);
close $handle;
my @pos = [0,0,0,0,0];
my @incr = [1,3,5,7,1];
my @Yincr = [1,1,1,1,2];
my @treeCnt = [0,0,0,0,0];
for (my $i=0; $i < scalar(@incr) ; $i++) { 
   for my $line (@lines) {
       my $spot = substr($line, $pos[$i], 1);
           print ("$line position $pos[$i]\n");
       if ($spot eq '#'){
           print ("hit a tree!!\n");
           $treeCnt[$i]++;
       }
       $pos[$i] = ($pos[$i]+$inc[$i]) % (length($line)); 
       #print (length($i));
       #print ("\n");
   }
}
print ("hit @treeCnt trees\n");

