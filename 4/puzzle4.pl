#!/usr/bin/perl

use Data::Dumper;
use Switch;
undef $/;
$/="";
open my $handle, '<', "/home/willy/AOC/4/input";
chomp(my @lines = <$handle>);
close $handle;
my $validCnt=0;

for my $line (@lines) {
    my $isValid = 1;
    #my @fields=split(/[\s,:,\n]/,$line);
    my @fields=split(/[\s,\n]/,$line);
    print(Dumper(@fields));
    #if ( ($#fields == 15) || ( $#fields == 13 && !(grep(/^cid/,@fields)))) {
    if ( ($#fields == 7) || ( $#fields == 6 && !(grep(/^cid/,@fields)))) {
       foreach $field (@fields){
           my @vals=split(/:/,$field);
           switch ($vals[0]) {
               case "byr" { if ($vals[1]>=1920 && $vals[1]<=2002){ print("Valid birth year $vals[1]\n") } else {$isValid=0; last} }
               case "iyr" { if ($vals[1]>=2010 && $vals[1]<=2020){ print("Valid issue year $vals[1]\n")} else {$isValid=0; last} }
               case "eyr" { if ($vals[1]>=2020 && $vals[1]<=2030){ print("Valid expire year $vals[1]\n")} else {$isValid=0; last} }
               case "hgt" {
                   my $units  = substr($vals[1],-2);
                   my $number = substr($vals[1], 0, -2);
                   if ( ($units eq "in" && $vals[1]>=59 && $vals[1]<=76) || ($units eq "cm" && $vals[1]>=150 && $vals[1]<=193) ){ 
                      print("Valid height $number$units\n") 
                   } else {
                      $isValid=0; 
                      last
                   } 
               }
               case "hcl" { if ($vals[1]=~/^#[0-9a-f]{6}$/ ) { print("Valid hair color $vals[1]\n")} else {$isValid=0; last} }
               case "ecl" { if ($vals[1]=~/^(amb|blu|brn|gry|grn|hzl|oth)$/ ) { print("Valid eye color $vals[1]\n")} else {$isValid=0; last} }
               case "pid" { if ($vals[1]=~/^[0-9]{9}$/){ print("Valid passportID $vals[1]\n")} else {$isValid=0; last} }
               case "cid" { }
               else       { print("unknown case $vals[0]\n"); die;}
           }
       }
    } else { $isValid = 0;}
    if ($isValid) {
       print "valid passport\n";
       $validCnt++;
    }
    #print("$#fields\n");
}

print("$validCnt\n");
