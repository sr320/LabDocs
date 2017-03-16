# Data Management Plan (DNA Sequence Data)

Data Management Plan for dealing with sequencing data. 

_see also_ : https://github.com/sr320/LabDocs/wiki/Data-Management


## Sequence Job Submission
_Phasing out_      
>We send material to a variety of facilities. As the samples are shipped to a facility, respective information is entered in the Google Docs spreadsheet [*Next Gen Seq Library Database*](https://docs.google.com/spreadsheet/ccc?key=0AtV_gF766XZAdHRlUHJMd0k4S2RpdTZqbjFob2NJb2c&usp=sharing).


## Raw Data
1) As sequencing facility provdes data, files are downloaded to our local NAS (owl), in the root `nightingales` directory.  http://owl.fish.washington.edu/nightingales/

2) The [Nightingales Google Spreadsheet](https://docs.google.com/spreadsheets/d/1_XqIOPVHSBVGscnjzDSWUeRL7HUHXfaHxVzec-I-8Xk/edit) is updated.

3) Update the Nightingales Google Fusion Table with new information from the Nightingales Google Spreadsheet.  This is accomplished by:

- deleting all rows in the Nightingales Google Fusion Table (Edit > Delete all rows)
- Importing data from the Nightingales Google Spreadsheet (File > Import more rows...)


## Backup
* The Google Docs spreadsheet [Nightingales Google Spreadsheet](https://docs.google.com/spreadsheets/d/1_XqIOPVHSBVGscnjzDSWUeRL7HUHXfaHxVzec-I-8Xk/edit) is backed up on a regular basis? by downloading tab-delimited file and pushing to LabDocs Repository, with the file name `Nightingales.tsv`

* The nightingales directory on owl is backed up to Amazon Glacier. This is accessible by .......?



## SRA Upload

## Owl Uploader

* Requirements: Directory with new sequence data, MD5 file from sequencing facility, copy of owluploader.R, destination directory on owl.

1) Copy the owluploader.R script to the directory that contains the new data and the MD5 file provided by the facility. Script needs write access to this directory to create temporary and log files.

2) Edit owluploader.R. Change the string on line 12 to be the directory for the new data, line 13 to the facility MD5 file name, and line 14 to the destination directory on owl.

3) Open terminal, type "Rscript owluploader.R" in the terminal.

4) When the script completes, inspect the MD5Mismatch.txt file for files that did not copy correctly. Also inspect the checksum.md5 and readme.MD files to make sure the new files were added properly.
