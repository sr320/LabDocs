if ($#ARGV == 1) {
	$file = $ARGV[0];
	$barcode = $ARGV[1];
} else {
	die;	
}

$barcode_length = length($barcode);

open(FILE, "<$file")
	or die;

while (<FILE>) {

	$ID_line_1 = $_;
	$seq_line = <FILE>;
	$ID_line_2 = <FILE>;
	$Quality_line = <FILE>;
	
	chop $seq_line;
	$bc = substr($seq_line,0,$barcode_length);
	
	if ($bc eq $barcode)  {
		$correct_count++;
		
		$read_length = length($seq_line) - ($barcode_length);
		$read = substr($seq_line,($barcode_length),$read_length);

		$Quality_line_trimmed = substr($Quality_line,($barcode_length),$read_length);
		
		print $ID_line_1;
		print "$read\n";
		print $ID_line_2;
		print "$Quality_line_trimmed\n";

	} 

}
close FILE;

