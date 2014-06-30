file = $ARGV[0];

open(FILE, "<$file")
	or die;

while (<FILE>) {
	$ID_line_1 = $_;
	$seq_line = <FILE>;
	$ID_line_2 = <FILE>;
	$seq_line2 = <FILE>;
	
	#my @mism_pos;
	for $i (0 .. length($seq_line)) {
   		$source_base = substr($seq_line,$i,1);
   		$str_base    = substr($seq_line2,$i,1);

  		if ($source_base ne $str_base) {
     	push @mism_pos,$i;
     	push @mism_base1,(substr(
  		}

	}
