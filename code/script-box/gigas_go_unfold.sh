#!/bin/bash

sed 's/; /\t/g' /path/to/input/file > /path/to/new/filename

file="/path/to/new/filename"
while read -r line
	do
	max_field=$(echo "$line" | awk -F'\t' '{print NF}')
	set_fields=$(echo "$line" | cut -f1-12)
	if (( "$max_field" < 13 ))
		then printf "%s\n" "$line"
		else
			goterms=$(echo "$line" | cut -f13-$max_field)
			IFS=$'\t' read -r -a array <<<"$goterms"
				for element in "${!array[@]}"	
					do printf "%s\t%s\n" "$set_fields" "${array[$element]}"
				done
	fi
done < /path/to/new/filename > rhonda_fixed.txt
