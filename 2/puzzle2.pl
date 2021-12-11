#!/usr/bin/perl

use Data::Dumper;

open my $handle, '<', "/home/willy/AOC/2/input";
chomp(my @a = <$handle>);
close $handle;
my $validCount = 0;
my $validCount2 = 0;
for my $i (@a) {
    my @pass = split(/[-, ,:]/,$i);
    my $min = $pass[0];
    my $max = $pass[1];
    my $letter = $pass[2];
    my $password = $pass[4];
    my $count = () = $password =~ /\Q$letter/g;
    #print("count $count of $letter in $password\n");
    if ($count >= $min && $count <= $max) {
        #print ("Valid password $i\n");
        $validCount++;
    }
#    print Dumper(@pass);
    my $pos1 = substr($password, $min-1, 1);
    my $pos2 = substr($password, $max-1, 1);
    print ("pos1 = $pos1, pos2 = $pos2\n");
    #if (substr($password, $min-1, 1) == $letter && substr($password, $max-1, 1) != $letter) {
    if ($pos1 eq $letter && !($pos2 eq $letter)  || $pos2 eq $letter && !($pos1 eq $letter) ) {
        print ("Valid password2 $i\n");
        $validCount2++;
    }
}

print("Found $validCount valid passwords.\n");
print("Found $validCount2 valid2 passwords.\n");

