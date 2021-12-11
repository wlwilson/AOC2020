#!/usr/bin/perl



open my $handle, '<', "/home/willy/AOC/1/input";
chomp(my @a = <$handle>);
close $handle;

for my $i (@a) {
    for my $j (@a) {
        if ($i + $j == 2020 ) {
            my $ij = $i*$j;
            print("$i $j = $ij\n");
        }
    }
}

for my $i (@a) {
    for my $j (@a) {
        for my $k (@a) {
            if ($i + $j + $k == 2020 ) {
                my $ijk = $i*$j*$k;
                print("$i $j $k = $ijk\n");
            }
        }
    }
}