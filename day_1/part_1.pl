# load input
open my $input, '<', 'input_p1.txt';

$total = 0;
foreach my $line (<$input>) {
    if ($line =~ /.*?(\d).*(\d)/) {
        $total += $1 . $2;
    } elsif ($line =~ /.*(\d).*/) {
        $total += $1 . $1;
    }
}

print "Total: $total\n";
close $input;