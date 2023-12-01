# load input.txt file
open my $input, '<', 'input_p2.txt';

my $total = 0;
my $digits_pattern = qr/one|two|three|four|five|six|seven|eight|nine|[1-9]/;
foreach my $line (<$input>) {
    chomp $line;
    if ($line =~ /.*?($digits_pattern).*($digits_pattern)/) {
        print "Matched: $1, $2\n";
        $total += to_digit($1) . to_digit($2);
    } elsif ($line =~ /.*($digits_pattern).*/) {
        $digit = to_digit($1);
        $total += $digit . $digit;
    }
}

sub to_digit {
    my $input = shift;

    my %word_to_number = (
        'one'   => 1,
        'two'   => 2,
        'three' => 3,
        'four'  => 4,
        'five'  => 5,
        'six'   => 6,
        'seven' => 7,
        'eight' => 8,
        'nine'  => 9,
    );

    if (exists $word_to_number{$input}) {
        return $word_to_number{$input};
    } elsif ($input =~ /^[1-9]$/) {
        return $input;
    } else {
        return undef;
    }
}

print "Total: $total\n";
close $input;