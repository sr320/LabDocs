###Shortcuts
Keyboard shortcuts in Terminal (OSX)    
Skip to beginning of line: Ctrl+a   
Skip to end of line: Ctrl+e   
Skip forward a word: Esc+f   
Skip back a word: Esc+b   

---

###Simple for loop in terminal

`for i in e f; do echo $i; done`


---

###Count the number of lines in a file
`$wc -l < /path/to/file`

Explanation:

wc = Terminal command for "word count"

-l = Flag to specify line count

< = Redirect your file as the input data source for the "wc" command


---
###Count the number of instances/occurrences of items in a column in a file

`$cut -f1 /path/to/file | sort | uniq -c`

Explanation:

cut - Command to apply options to the designated field (i.e. column).

-f1 - -f1 = specifies which field (i.e. column) to work on. Change the number to specify your desired column. Or, you can even specify a range of columns to work on (e.g. -f2-6)

/path/to/file - Location of file to operate on.  If file is in current directory, no path is needed; just use the filename

"|" - Pipe which sends the results of the previous command ("cut" in this example) to another command.

sort - Sorts the info from the "cut" command in ascending order.

"|" - Pipe which sends the results of the previous command ("sort" in this example) to another command.

uniq -c - Counts the number of occurrences of each unique "word" in the specified column(s). (Note: Technically "uniq -c" is counting the occurrence of each unique line in the specified column, not the actual "words." It is this reason (that uniq occurrences are tallied by line) that you use the cut command to have the uniq command focus on a single column from the source file.)

---

###Count the number of columns in a file

```
$awk '{print NF; exit}' input_file.txt
```

This reads the number of fields (```NF```; i.e. columns) in just the first row of the input file specified. If you suspect you may have more columns that are not represented on the first line of your file, remove the ```; exit``` from the command to have awk scan the entire file.

---

---
###Count the number of characters in column

`awk '{print $1, "\t", $2, "\t", length($2)}' j_tab2 > tab_1_length﻿`

---

###Substitutions in a File
This is the same as Find and Replace in programs like Microsoft Word, but will run on files that are too large to be opened with such programs.

```
$sed 's/text_you_want_replaced/replacement_text/g' path/to/source_file > path/to/destination_file
```

Code explanation:

"s" invokes the substitute command in sed
    
"g" tells sed to apply the substitute command globally on each line. Without the "g" argument, sed will only apply your substitute command to the first instance it encounters on each line that contains your "text_you_want_replaced".

NOTE: This command is case sensitive and will only match EXACLTY what you enter in as the "text_you_want_replaced". If you need more flexibility (e.g. having sed find variations like upper- and lowercase text), it exists, but is a bit too in-depth to go into here.

---

###Replace delimiters with different characters

Here's an example:

```
$awk '{ print $1"\t"$2"_"$3"_"$4 }' input_file.txt > output_file.txt
```

The above code will replace the delimiters after each field (i.e. column) with the indicated character. In this instance, the space between columns 1 and 2 is replaced with a tab (```\t```). The space between columns 2 & 3 is replaced with an underscore.

---


###Convert FASTQ to FASTA
    zcat input_file.fastq.gz | awk 'NR%4==1{printf ">%s\n", substr($0,2)}NR%4==2{print}' > output_file.fa

---
###Audible Notification of Job Completion (Terminal)

After typing in a Terminal command (and before hitting 'Enter') add the following:

`; say "Text that you want to have the computer read aloud to notify you that the job is finished"`

Code explanation:

; - Semicolon separates the "say" command from the previous command.

say - The speech-to-text command for Terminal

"text between quotes" - This is the text that you want to be read when your job is finished.




---

### Moving multiple files from multiple subdirectories up one level into a single folder.

Example code is below which will move any files with the extension ".sra" in any subdirectories to a new, single directory. An explanation of how it works after the code.
    
```   
find /volume1/web/trilobite/Crassostrea_gigas_HTSdata/SRP014 -iname '*.sra' -exec mv '{}' /volume1/web/trilobite/Crassostrea_gigas_HTSdata/SRP014 \;
```

Code explanation:

find - The command to initiate a search for files

/volume1/web/trilobite/Crassostrea_gigas_HTSdata/SRP014 - Example path to a starting directory.  The find command searches recursively (i.e. from current directory through any/all subfolders containd therein) by default.

-iname - Test for the find command to perform a case insensitive search.

'*.sra' - The expression that the find command is evaluating.  The asterisk is a wildcard and will match 0 or more characters before ".sra".  So, in this example, the find command is using "-iname" to find all file names that end with the ".sra" suffix (file type).

-exec mv - Action that tells the find command to execute a move (mv) command on all matching file names.

'{}' - Empty expansion braces that are filled with the result of the find command to be processed.  As each matching file is encountered, the file name is expanded in the curly braces until it is handled by another program/option.  It is then removed from the curly braces and the next match is then entered into the curly braces.

/volume1/web/trilobite/Crassostrea_gigas_HTSdata/SRP014 - Example path to destination directory for any/all files that are to be moved.

\; - The semi-colon is required to end the find command.  However, the semi-colon is a special character in the bash.  So, a backslash is required to escape (i.e. ignore) the semi-colon from being interpreted by bash.


---

### Sum Column in Tab Delimited File

**code:** `cat /Volumes/web/cnidarian/TGR_intersectbed_CDS_v9_CGmotif.txt | awk -F"\t" '{ sum+=$10} END {print sum}'`

screenshot:
<img src="http://eagle.fish.washington.edu/cnidarian/skitch/BiGo_methratio_17A2220E.png" alt="BiGo_methratio_17A2220E.png"/>

---

### Count Lines with String

**code:** `!fgrep -c "fuzznuc" /Volumes/web/cnidarian/TJGR_oyster_v9_CG.gff`   

screenshot:   
<img src="http://eagle.fish.washington.edu/cnidarian/skitch/BiGo_methratio_17A2231A.png" alt="BiGo_methratio_17A2231A.png"/>


---

### Convert csv to tab

**code:** `!tr ',' "\t" </Users/sr320/Desktop/Ruphi\ Enriched\ Genes.csv> /Users/sr320/Desktop/Ruphi\ Enriched\ Genes.txt`

---

### Copy Program of Interest to Run

**code:** `cp ncbi-blast-2.2.27+/bin/* /usr/local/bin`

---
###Remove duplicate lines
**code:** `!uniq  /Volumes/web/cnidarian/TJGR_prom_notgene_cpgIsland1.gff  > /Volumes/web/cnidarian/TJGR_prom_notgene_cpgIsland1u.gff`

---

### Remove first line of file

**code:** `!tail -n +2 /Volumes/web/cnidarian/BiGo_methratio_boop.gff > /Volumes/web/cnidarian/BiGo_methratio_boop_c.gff`


---
### Remove lines containing
**code:**  `!grep -Ev '>' /Volumes/web/Mollusk/174gm_analysis/GenomeTracks_Fastas/Exons.fa > /Users/sr320/Desktop/tst.txt`

---   

### Find and Replace   


**code:**    

```
!sed 's/Roberts_20100712_CC_F3_trimmed/Haliotis_cra_v3/g' </Volumes/web/cnidarian/lft_BlackAbalone_v3_swissprot_blastout_c> /Volumes/web/cnidarian/lft_BlackAbalone_v3_swissprot_blastout_d
#sed 's/abc/XYZ/g' <infile> outfile
```

---

###Remove spaces from filenames in a directory

```
for file in *; do mv "$file" ${file// /}; done
```

Explanation:

```for file in *;``` - A for loop that looks at all files in the current directory. The word ```file``` is a variable that takes on the value of each file name in the directory (one file name per loop). The ```;``` is needed for bash for loop formatting.

```do mv "$file" ${file// /};``` - Tells bash to use the move command (```mv```) and use the current contents of the variable ```$file``` as the initial filename. The ```${file// /}``` is a substitution command that tells bash to use the contents of the ```file``` variable and replace all spaces (```// ```) with nothing (```/``` - you can add text after this slash to replace with information of your choice). The The ```;``` is needed for bash for loop formatting.

```done``` - Ends the for loop

---

###Back up websites for offline viewing

Note: Uses ```wget``` which is not installed on Mac OS X by default.

```
time wget -U mozilla -E -r -H -k -p -R *.xad,*.zip,*.gz,*.fastq -Donsnetwork.org,eagle.fish.washington.edu,http://heareresearch.blogspot.com --no-parent -e robots=off --wait=60 --random-wait --limit-rate=10m http://website.com/notebook
```

Explanation:

```wget``` - Program for downloading remote files

```-U mozilla``` - Specifies the user agent (in this case, mozilla) that ```wget``` presents itself as to the remote server. Using this gets around sites that disallow standard ```wget``` requests.

```-E``` - Save HTML/CSS documents with proper extensions.

```-r``` - Downloads recursively (i.e. follows all links and downloads content from those links).

```-H``` - Go to foreign hosts when recursive (i.e. follow links outside of current website). This will download images hosted on other websites.

```-k``` - Make links in downloaded HTML or CSS point to local files.

```-p``` - Get all images, etc. needed to display HTML page.

```-R *.xad,*.zip,*.gz,*.fastq``` - The ```-R``` flag specifies files to reject. The command is followed by a comma-separated list of files to skip when downloading.

```-Donsnetwork.org,eagle.fish.washington.edu,http://heareresearch.blogspot.com``` - The ```-D``` flag specifies which domains content can be downloaded from. The flag is followed by a comma-separated list of domains (and/or subdomains) of the allowed websites.

```--no-parent``` - This argument instructs ```wget``` to only download items within and below the initial directory specified.

```--wait=60``` - Sets an interval, in seconds, that ```wget``` should wait between download requests. Although this is not necessary, it's a polite way to approach recursive downloads from a server so that the server isn't overwhelmed trying to process the entire ```wget``` requests. In this example, the wait time is governed by the next option (```--random-wait```).

```--random-wait``` - This sets the request interval to a random value between 0.5 x ```-wait``` and 1.5 x ```wait```, in seconds. So, in this example, ```wget``` will wait between 30 and 90 seconds between file retrieval requests. This is a polite way to to approach recursive downloads from a server so that the server isn't overwhelmed trying to process the entire ```wget``` requests.

```--limit-rate=10m``` - Limits bandwidth usage to 5MB/s. Without setting a rate limit, ```wget``` will use the maximum amount of bandwidth and, potentially, greatly slow the server's response. This is a polite way to to approach recursive downloads from a server so that the server isn't overwhelmed trying to process the entire ```wget``` requests.

```http://website.com/notebook``` - Replace this with the URL to the desired notebook.

---
