#!/bin/bash

# This script was written to address a specific problem that Rhonda was having
# where multiple GO terms are present in a single field, but she needs them
# on separate lines.
# See this GitHub issue for explanation of the problem:
# https://github.com/sr320/LabDocs/issues/654

# This script is written to operate on the file located here:
# https://github.com/RobertsLab/project-pacific.oyster-larvae/blob/master/DIA_2015/AnnotatedproteinsGO.tabular

# Before executing this script, the following need to be changed (look for them below):

# /path/to/input/file
# /path/to/new/filename
# /path/to/new/filename

# sed command substitutes the "; " sequence to a tab and writes the new format to a new file.
# This character sequence is how the GO terms are delimited in their field.
sed 's/; /\t/g' /path/to/input/file > /path/to/new/filename

# Saves location of the newly formatted file to variable called "file".
file="/path/to/new/filename"

# While loop to process each line of the input file.
while read -r line
	do
	
	# Send contents of the current line to awk.
	# Set the field separator as a tab (-F'\t') and print the number of fields in that line.
	# Save the results of the echo/awk pipe (i.e. number of fields) to the variable "max_field".
	max_field=$(echo "$line" | awk -F'\t' '{print NF}')

	# Send contents of current line to cut.
	# Cut fields (i.e. retain those fields) 1-12.
	# Save the results of the echo/cut pipe (i.e. fields 1-12) to the variable "fixed_fields"
	set_fields=$(echo "$line" | cut -f1-12)

	# Since not all the lines contain the same number of fields (e.g. may not have GO terms),
	# evaluate the number of fields in each line to determine how to handle current line.

	# If the value in max_field is less than 13 (GO terms are present starting in field 13, if they're present),
	# then just print the current line (%s) followed by a newline (\n).
	if (( "$max_field" < 13 ))
		then printf "%s\n" "$line"
			else

			# Send contents of current line (which contains GO terms) to cut.
			# Cut fields (i.e. retain those fields) 13 to whatever the last field is in the curent line.
			# Save the results of the echo/cut pipe (i.e. all the GO terms fields) to the variable "goterms".
			goterms=$(echo "$line" | cut -f13-$max_field)
			
			# Assign values in the variable "goterms" to a new indexed array (called "array"), 
			# with tab delimiter (IFS=$'\t')
			IFS=$'\t' read -r -a array <<<"$goterms"
			
			# Iterate through each element of the array.
			# Print the first 12 fields (i.e. the fields stored in "fixed_fields") followed by a tab (%s\t).
			# Print the current element in the array (i.e. the current GO term) followed by a new line (%s\n).
			for element in "${!array[@]}"	
				do printf "%s\t%s\n" "$set_fields" "${array[$element]}"
			done
	fi

# Send the input file into the while loop and send the output to a file named "rhonda_fixed.txt".
done < /path/to/new/filename > rhonda_fixed.txt
