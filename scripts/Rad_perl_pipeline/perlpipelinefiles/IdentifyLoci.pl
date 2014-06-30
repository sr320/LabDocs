#######################################################################################
$max_alignment_score = 30;
$divergence_factor = 3;
$min_count = 3;
$max_internal_alignments = 1;
$min_internal_alignments = 0;
$max_external_alignments = 2;
$min_external_alignments = 1;
$max_total_alignments = 3;
$min_total_alignments = 1;
$min_alleles = 1;
$max_alleles = 2;
#######################################################################################

$file = $ARGV[0];

open(FILE, "<$file") or die;
while (<FILE>) {
	$line = $_;
	chomp($line);
	if (substr($line,0,1) eq ">") {
		@tabs = split(/\t/,$line);

		$query = $tabs[0];
		($query_lib, $query_ID, $query_count) = split(/\;/, $query); 
		$index = $tabs[7]; 
		($index_lib, $index_ID, $index_count) = split(/\;/, $index);
		
		$score = $tabs[5];
		$change = $tabs[13];
		$query_sequence = $tabs[2];

		if ($query eq $index) {
			$query_sequences{$query} = $query_sequence;
		} else {
			if ($query_lib eq $index_lib) {
				if ($index_count >= $min_count) {
					push(@{$internal_alignments{$query}}, $index);
					push(@{$internal_alignment_scores{$query}}, $score);
				}
			} else {
				if ($score == 0) {
					push(@{$perfect_external_alignments{$query}}, $index);
					push(@{$external_alignments{$query}}, $index);
					push(@{$external_alignment_scores{$query}}, $score);
				} elsif ($index_count >= $min_count) {
					push(@{$external_alignments{$query}}, $index);
					push(@{$external_alignment_scores{$query}}, $score);
				}
			}
		}

	}
}

$locus = 1;
foreach $query (keys %query_sequences) {
	if ($printed{$query} != 1) {
	
		$bad = 0;
		@alleles = valid_alignments($query);
		$string1 = "@alleles";

		if ($string1 ne "") {
			foreach (@alleles) {
				@alleles2 = valid_alignments($_);
				$string2 = "@alleles2";
				if ($string1 ne $string2) { $bad = 1; }
			}
			if ($bad != 1) {
				$print_string = ""; $print_count = 0;
				foreach (@alleles) {
					if ($printed{$_} != 1) {
						@matches = ($_, @{$perfect_external_alignments{$_}});
						@matches = sort(@matches);
						$ID = "";
						foreach (@matches) { 
							$ID = $ID . substr($_,1,length($_)) . "|"; 
							$printed{$_} = 1;	
						}
						chop($ID);

						$print_string = $print_string . ">$locus\{$ID\}\n";
						$print_string = $print_string . $query_sequences{$_} . "\n";
						$print_count++;
					}
				}
				if ($print_count >= $min_alleles && $print_count <= $max_alleles) {
					print $print_string;
					$locus++;
				}
			}
		}

	}
}

sub valid_alignments {
	$seq = $_[0];
	@int_aligns = ();
	@ext_aligns = ();
	@aligns = ();
	$flag = 0;

	($seq_lib, $seq_ID, $seq_count) = split(/\;/, $seq); if ($seq_count < $min_count) { $flag = 1; }  #TESTING 

	$x = 0;
	while ($x < scalar(@{$internal_alignments{$seq}})) {
		if ($internal_alignment_scores{$seq}[$x] <= $max_alignment_score) {
			push(@int_aligns, $internal_alignments{$seq}[$x]);
		} elsif ($internal_alignment_scores{$seq}[$x] < $max_alignment_score*$divergence_factor) {
			$flag = 1;
		}
		$x++;
	}
	if (scalar(@int_aligns) > $max_internal_alignments 
	|| scalar(@int_aligns) < $min_internal_alignments) { $flag = 1; }

	$x = 0;
	while ($x < scalar(@{$external_alignments{$seq}})) {
		if ($external_alignment_scores{$seq}[$x] <= $max_alignment_score) {
			push(@ext_aligns, $external_alignments{$seq}[$x]);
		} elsif ($external_alignment_scores{$seq}[$x] < $max_alignment_score*$divergence_factor) {
			$flag = 1;
		}
		$x++;
	}
	if (scalar(@ext_aligns) > $max_external_alignments
	|| scalar(@ext_aligns) < $min_external_alignments) { $flag = 1; }

	if (scalar(@int_aligns)+scalar(@ext_aligns) > $max_total_alignments
	|| scalar(@int_aligns)+scalar(@ext_aligns) < $min_total_alignments) { $flag = 1; }

	if ($flag != 1) {
		@aligns = ($seq, @int_aligns, @ext_aligns);
		@aligns = sort(@aligns);
		return @aligns;
	}
}

