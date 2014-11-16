########################################################################
$percent_filter = 80;
$length = 72;
########################################################################


$file = $ARGV[0];

open(FILE, "<$file")
	or die;

while (<FILE>) {
	
	$R1_ID1 = $_;
	$R1_seq = <FILE>;
	$R1_ID2 = <FILE>;
	$R1_qual = <FILE>;
	chomp($R1_seq);	
	chomp($R1_qual);

	$R1_seq = substr($R1_seq,0,$length);
	$R1_qual = substr($R1_qual,0,$length);

	if ($R1_seq =~ m/N/) {

	} else {

		@ASCII = unpack("C*", $R1_qual);
		$prob = 100;
		$x = 1;
		$R1_length = length($R1_qual);
		foreach $value (@ASCII) {
			$value = $value - 64;
			$prob = $prob * (1-(10**(-$value/10)));
			$x++;
		}

		if ($prob >= $percent_filter) {
			$good_reads++;
			print $R1_ID1;
			print "$R1_seq\n";
			print $R1_ID2;
			print "$R1_qual\n";
		}

	}
	
}
close FILE;

