#!/usr/bin/perl

use Data::Dumper;

open my $handle, '<', "input1";
chomp(my @lines = <$handle>);
close $handle;
#@rules;
%rules;

for my $line (@lines) {
    print("$line\n");
    # my @data = (/[bags contain|,]/,$line);
    if( $line=~/(.+)\s+bags contain\s+(\d+)\s+(.+) bags*[,.]\s+(\d+)\s+(.+)*bags*/){
        print("$1 contain $2 $3 and $4 $5\n");
        #push @rules, ([$1,$3,$5]);
        #$rules{$1}=([$3,$2,$5,$4]);
        $rules{$1}=([{$3=>$2},{$5=>$4}]);
        print Dumper ([{$3=>$2},{$5=>$4}]);
    }elsif($line=~/(.+)\s+bags contain\s+(\d+)\s+(.+) bags*[,.]/){
        print("$1 contain $2 $3\n");
        #push @rules, ([$1,$3]);
        $rules{$1}=([{$3,$2}]);
    }elsif($line=~/(.+)\s+bags contain no other bags*[,.]/){
        $bags=0;
        #push @rules, ([$1]);
        $rules{$1}={0};
        print("$1 contain $bags bags\n");
    }
    print("\n");
}

#print Dumper %rules;
print Dumper $rules{"shiny gold"}

sub holds($smColor,$lgColor) {
    if $rules{$lgColor} #contains smColor
    return true
    else
    return holds
}



