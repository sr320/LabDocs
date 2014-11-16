#This is your imput file
$file = $ARGV[0];
#This is just the name of your library, it will be used to name the sequences in the output file.
$lib = $ARGV[1];

open(FILE, "<$file")
	or die;

while (<FILE>) {
		
	$seq_line = <FILE>;
	chomp($seq_line);
	$tags{$seq_line}++;

	$_ = <FILE>;
	$_ = <FILE>;
}
close FILE;


$z = 1;
foreach $key (sort { $tags{$b} <=> $tags{$a} } keys %tags) {

	print ">$lib;$z;$tags{$key}\n";
	print "$key\n";

	$z++;
}


