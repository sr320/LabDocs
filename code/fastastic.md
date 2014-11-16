#FASTAstic


###Fasta to tab-delimited

```
!perl -e '$count=0; $len=0; while(<>) {s/\r?\n//; s/\t/ /g; if (s/^>//) { if ($. != 1) {print "\n"} s/ |$/\t/; $count++; $_ .= "\t";} else {s/ //g; $len += length($_)} print $_;} print "\n"; warn "\nConverted $count FASTA records in $. lines to tabular format\nTotal sequence length: $len\n\n";' /Volumes/web/cnidarian/oyster.v9.fa > /Volumes/web/cnidarian/cgigas_v9_genome01.tab
```
---

###Count bp in fasta Tab-delim

```
!perl -e '$col = 2;' -e 'while (<>) { s/\r?\n//; @F = split /\t/, $_; $len = length($F[$col]); print "$_\t$len\n" } warn "\nAdded column with length of column $col for $. lines.\n\n";' /Volumes/web/cnidarian/cgigas_v9_genome01.tab > /Volumes/web/cnidarian/cgigas_v9_genome02.tab
```


---  