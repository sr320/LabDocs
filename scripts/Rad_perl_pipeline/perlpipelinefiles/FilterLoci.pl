#########################################################################################
$min_alleles = 1;
$max_alleles = 2;
$min_libs = 0;
$max_libs = 1;
#########################################################################################

$file = $ARGV[0];

open(FILE, "<$file") or die;
while (<FILE>) {
	$line = $_; chomp($line);

	if (substr($line,0,1) eq ">") {
	
		$sequence = <FILE>; chomp($sequence);
		$name = $line;
		($locus, $ID) = split(/\{/,$name);
		@seqs = split(/\|/,$ID);

		@lib_array = ();
		foreach (@seqs) {
			$seq = $_;
			($lib) = split(/\;/, $seq);
			push(@lib_array, $lib);
		}

		$allele_count{$locus}++;
		#This next line is the problem, it is counting the total number of libraries for both alleles at this locus
		#which means I can't filter the low count alleles that appear in only one library!!!
		$lib_count{$locus} = $lib_count{$locus} + scalar(@lib_array);
	}
}
close FILE;

open(FILE, "<$file") or die;
while (<FILE>) {
	$name = $_;
	if (substr($name,0,1) eq ">") {
		$seq = <FILE>;
		($locus, $ID) = split(/\{/,$name);
		if ($allele_count{$locus} >= $min_alleles && $lib_count{$locus} >= $min_libs
		&& $allele_count{$locus} <= $max_alleles && $lib_count{$locus} <= $max_libs) {
			print "$name$seq";
		}
	}
}
close FILE;


