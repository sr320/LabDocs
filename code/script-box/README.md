### Miscellaneous scripts
#### 2_Blast2Gff.pl - Needs description.

#### count_fasta.pl - Needs description.

#### download_fastas.sh - Needs description.

#### fasta-splitter.pl - Needs description.

#### gigas_go_unfold.sh

"Unfolds" a single line containing multiple, semi-colon-delimited GO terms contained in a single field (i.e. cell) and puts them in their own field, on their own line. See [this issue for background](https://github.com/sr320/LabDocs/issues/654).

Accepts this input (GO terms have to be in last field):

| Record 1| Record 2| Record 3 | Record 4 |
|:--------|:--------|:-----------|:--------------------------------------|
| field 1 | field 2 | field 3..n | GOterm1; GOterm2; GOterm3; GOterm_n...|
 ----------
 
Outputs the following:

| Record 1| Record 2| Record 3 | Record 4 |
|:--------|:--------|:-----------|:--------------------------------------|
| field 1 | field 2 | field 3..n | GOterm1 |
| field 1 | field 2 | field 3..n | GOterm2 |
| field 1 | field 2 | field 3..n | GOterm3 |
------

#### notebook_backups.sh - Needs description.

#### splitMultiFasta.pl - Needs description.

#### owluploader.R - Uploads file to Owl in the appropriate directory and checks MD5 sums against a canonical MD5 file (facility provided) at each copy step. Requires User script updates on line 12, 13, and 14 of new data location, the canonical MD5 file, and the destination owl directory.

OwlUploader.ipynb - Jupyter notebook implementation of owluploader.R. Same requirements as the R script.
