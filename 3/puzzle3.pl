#!/usr/bin/perl

use Data::Dumper;

open my $handle, '<', "/home/willy/AOC/3/input";
chomp(my @lines = <$handle>);
close $handle;
my @pos = (0,0,0,0,0);
my @incr = (1,3,5,7,1);
my @Yincr = (1,1,1,1,2);
my @treeCnt = (0,0,0,0,0);
print(scalar(@incr));
print ("\n");
#for (my $i=0; $i < scalar(@incr) ; $i++) { 
for (my $i=0; $i < 5 ; $i++) { 
   my $lineCnt = 0;
   for my $line (@lines) {
       my $spot = substr($line, $pos[$i], 1);
           print ("$line position $pos[$i]\n");
       if (($spot eq '#') && ( ($lineCnt % $Yincr[$i])==0) ){
           print ("hit a tree!!\n");
           $treeCnt[$i]++;
       }
       #if($Yincr[$i]==1){
       if(($lineCnt % $Yincr[$i])==0){
          $pos[$i] = ($pos[$i]+$incr[$i]) % (length($line)); 
       }else{
           print ("Skipping line $lineCnt");
       }
       #print (length($i));
       #print ("\n");
       $lineCnt++;
   }
}
print (Dumper(@treeCnt));

my $mult = $treeCnt[0]*$treeCnt[1]*$treeCnt[2]*$treeCnt[3]*$treeCnt[4];
print ("mult $mult\n");
