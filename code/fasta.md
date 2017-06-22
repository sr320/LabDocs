#  FASTAstic
 
 
###  Convert FASTQ to FASTA
     zcat input_file.fastq.gz | awk 'NR%4==1{printf ">%s\n", substr($0,2)}NR%4==2{print}' > output_file.fa
     
 ---
     
###  Fasta to tab-delimited
 
 ```
 !perl -e '$count=0; $len=0; while(<>) {s/\r?\n//; s/\t/ /g; if (s/^>//) { if ($. != 1) {print "\n"} s/ |$/\t/; $count++; $_ .= "\t";} else {s/ //g; $len += length($_)} print $_;} print "\n"; warn "\nConverted $count FASTA records in $. lines to tabular format\nTotal sequence length: $len\n\n";' /Volumes/web/cnidarian/oyster.v9.fa > /Volumes/web/cnidarian/cgigas_v9_genome01.tab
 ```
 ---
 
###  Tab-delimited to fasta
 
 `!awk '{print ">"$1"\n"$2}'`
 
 
 
 ---
 
###  Count bp in fasta Tab-delim
 
 ```
 !perl -e '$col = 2;' -e 'while (<>) { s/\r?\n//; @F = split /\t/, $_; $len = length($F[$col]); print "$_\t$len\n" } warn "\nAdded column with length of column $col for $. lines.\n\n";' /Volumes/web/cnidarian/cgigas_v9_genome01.tab > /Volumes/web/cnidarian/cgigas_v9_genome02.tab
 ```
 
###  Count Number of Sequences in a FASTA File (grep)
 
     $grep -c '>' path/to/InputFasta/file.fasta
 
###  Count Number of Sequences in a FASTA File (awk)
 
     $awk '/>/ { count++ } END { print count }' path/to/InputFastFile.fasta
 
 Code explanation:
 />/
 - Tells awk to look for whatever regular expression is between the two slashes. In this instance, a greater-than symbol (which identifies a new sequence entry in a FASTA file).
 
 { count++ }
 - Tells awk to assign the variable called "count" to the results of counting ("++") all of the greater-than symbols it encounters
 
 END{ print count }
 - Tells awk to print the variable called "count", which is the total number of ">" in our input FASTA file
 
 NOTE: If the sequence IDs of your FASTA file also contain ">", the one-liner listed above will report an inaccurate result. However, as FASTA formatting goes, a ">" should never appear in the file other than as a sequence ID indicator.
 
 
 
 
 ---  
 
###  Filter FASTA File by Minimum Sequence Length
 Just change the number "200" in the code below to your desired minimum sequence length. 
 
 ```
 $ awk '!/^>/ { next } { getline seq } length(seq) >= 200 { print $0 "\n" seq }' /path/to/InputFastaFile.fasta > /path/to/OutputFastaFile.fasta
 ```  
 
 Code explanation:
 !/^>/ {next }     
 – If a line (i.e. record) begins with a “>”, go to the next line (record). The "!" tells awk to skip the regular expression that immediatley follows. The "^" tells awk that the regular expression it's looking for should only match if it's at the beginning of a line. Finally, the regular expression we're looking for in this example is the ">", which denotes the sequence descriptor portion of FASTA files.    
 { getline seq }    
 – “getline” reads the next record and assigns the entire record to a variable called “seq”    
 length(seq) >=200     
 – If the length of the “seq” record is greater than, or equal to, 200 then…    
 {print $0 "\n" seq>}    
 – Print all records ($0) of the variable “seq” in the file that matched our conditions, each on a new line (“\n”)    
