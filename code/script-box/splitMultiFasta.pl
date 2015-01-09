#!/usr/bin/perl
 
print STDERR "
  SplitMultiFasta
  -------------------------------------------------
  Splits multi fasta into single sequences
 
  Usage:
  splitMultiFasta.pl InputFile OutputDirectory
  -------------------------------------------------
";
($inputfile, $outputdirectory) = @ARGV;
 
die " FATAL ERROR:\n Cant locate input file: $inputfile...\n" if !(-e $inputfile);
die " FATAL ERROR:\n Cant locate output directory: $outputdirectory...\n" if !(-d $outputdirectory);
 
open I, "$inputfile" || die " FATAL ERROR:\n Cant access '$inputfile'.\n";
 
while (<I>) {
	$lineCounter++;
	if ($_=~/>([^\s]*)/) {
		$headerCounter++;
		open O, ">$outputdirectory/$1.fna" || die " FATAL ERROR:\n Unable to write $outputdirectory/$1.fna\n";
	} else {
		$totalBp+=length($_);
	}
	print O "$_";
 
}
print STDERR "
REPORT:
$lineCounter lines parsed
$headerCounter sequences found
$totalBp bp total
";
