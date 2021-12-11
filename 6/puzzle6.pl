#!/usr/bin/perl

use Data::Dumper;
use List::MoreUtils qw(uniq);
use List::MoreUtils qw(any);

undef $/;
$/="";
open my $handle, '<', "/home/willy/AOC/6/input";
chomp(my @lines = <$handle>);
close $handle;
my $sumAnswers = 0;

foreach $chunk ( @lines ){
    my @lines = split(/\n/,$chunk);
    #print ( Dumper(@lines));
    #print ("$#lines\n");
    if($#lines==0){
        my @set = ();
        #print ("only one person answered yes on $lines[0]\n");
        @chars = split(//,$lines[0]);
        @chars1=uniq @chars;
        $sumAnswers = ($#chars1+1) + $sumAnswers;
        print("This set is @chars1 total is $#chars1 plus one\n");
    } else {
        my @set = ();
        my $count = 0;
        foreach $line (@lines){
            if(!@set && $count==0){
                @set=split(//,$line);
                $count++;
            }else {
                my @subSet = ();
                @testSet=split(//,$line);
                print ("line is $line, current set is @set\n");
                foreach $char (@testSet){
                    if( any { $_ eq $char } @set ) {
                        push(@subSet,$char);
                    }
                }
                @set=uniq @subSet;
                if(!@set){
                    print("Empty set!\n")
                }
            }
        } 
        @chars1=uniq @set;
        $sumAnswers = ($#chars1+1) + $sumAnswers;
        print("This set is @set total is $#chars1 plus one\n");
    }
}
print("Total: $sumAnswers\n");
