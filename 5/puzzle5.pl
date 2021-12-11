#!/usr/bin/perl

use Data::Dumper;
use Sort::Naturally;

open my $handle, '<', "/home/willy/AOC/5/input";
chomp(my @lines = <$handle>);
close $handle;

my $max = 0;
my $row = "";
my @seatIDs;

for my $line (@lines) {
my $minRow = 0;
my $maxRow = 127;
my $minSeat = 0;
my $maxSeat = 7;
my $seatNum = "";
    print("Next line $line\n");
    my $cpos = 0;
    for my $char (split(//,$line)){
        if ( $char eq 'F' && $cpos < 7 ){ #lower
            $maxRow=($maxRow+($minRow-1))/2;
        }elsif ( $char eq 'B' && $cpos < 7 ){
            $minRow=($maxRow+($minRow+1))/2;
        }elsif ( $char eq 'L' && $cpos > 6 ){ #lower
            $maxSeat=($maxSeat+($minSeat-1))/2;
        }elsif ( $char eq 'R' && $cpos > 6 ){
            $minSeat=($maxSeat+($minSeat+1))/2;
        }
        else { print("invalid line $line\n");}
        $cpos++;
        print("rowMin $minRow rowMax $maxRow seatMin $minSeat seatMax $maxSeat\n");
    }
    $seatNum = ($minRow * 8) + $minSeat;
    if($seatNum > $max) {$max = $seatNum;}
    print("Seat number $seatNum\n");
    push @seatIDs, $seatNum;
}
print("Maximum seat number $max\n");

@seatIDs = nsort(@seatIDs);
my $minSeatID = $seatIDs[0];
my $maxSeatID = $seatIDs[-1];
foreach $thisID (@seatIDs){
   print("Current seatID $thisID, current seat iter $minSeatID, \n");
   if($minSeatID==$thisID){
       print("seat $thisID is taken!\n");
   }else{
       print("seat $minSeatID is empty!\n");
       last;
   }
   $minSeatID++;
}
print ($#seatIDs);