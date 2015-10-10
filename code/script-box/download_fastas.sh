#!/bin/bash

for i in $*; do
	fasta=${i}.fasta;
	rm -f $fasta;

	curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=protein&term=${i}%%5BORGANISM%%5D&usehistory=y" > fetch.txt
	key=`cat fetch.txt | awk '/<QueryKey>/ {split($0, a, "<QueryKey>"); split(a[2], b, "</QueryKey>"); print b[1]}'`;
	web=`cat fetch.txt | awk '/<QueryKey>/ {split($0, a, "<WebEnv>"); split(a[2], b, "</WebEnv>"); print b[1]}'`;
	count=`cat fetch.txt | awk '/<QueryKey>/ {split($0, a, "<Count>"); split(a[2], b, "</Count>"); print b[1]}'`;

	retstart=0;
	interval=500;

	echo -n "${i}: 	";
	while [ $retstart -lt $count ]; do
		percent=$((retstart*100/count));
		echo -n " ${percent}%";
		curl -s "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&query_key=$key&WebEnv=$web&retstart=$retstart&retmax=$interval&rettype=fasta&retmode=text" >> $fasta;

		retstart=$((retstart + interval));
	done
	echo " 100%";

	check=`grep -c '>' $fasta`;
	echo "${i}: 	${check} returned of ${count} requested";
done
