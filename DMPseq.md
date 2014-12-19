#Data Management Plan (Sequence Data)

Data Management Plan for dealing with sequencing data. 


##Sequence Job Submission
We send material to a variety of facilities. As the samples are shipped to a facility, respective information is entered in the Google Docs spreadsheet [*Next Gen Seq Library Database*](https://docs.google.com/spreadsheet/ccc?key=0AtV_gF766XZAdHRlUHJMd0k4S2RpdTZqbjFob2NJb2c&usp=sharing).

>screenshot[![g](http://eagle.fish.washington.edu/cnidarian/skitch/Next_Gen_Seq_Library_Database_1A424204.png)](https://docs.google.com/spreadsheet/ccc?key=0AtV_gF766XZAdHRlUHJMd0k4S2RpdTZqbjFob2NJb2c&usp=sharing)


##Raw Data
1) As sequencing facility provdes data, files are downloaded to our local NAS (owl), in the root `nightingales` directory.  http://owl.fish.washington.edu/nightingales/

2) The Nightingales Google Spreadsheet is updated.

3) Update the Nightingales Google Fusion Table with new information from the Nightingales Google Spreadsheet.  This is accomplished by:

- deleting all rows in the Nightingales Google Fusion Table (Edit > Delete all rows)
- Importing data from the Nightingales Google Spreadsheet (File > Import more rows...)

4) Once metadata is included in the Google Fusion Table [Nightingales](https://www.google.com/fusiontables/DataSource?docid=13IxnqIZ_2Xpz_HE-3YcnU_egASYz9ZlA0PYIDGLN#rows:id=1), respective data files are moved to subdirectory labelled with first letter of genus followed by species ie `C_gigas`. Check url in Nightingales Fusion table to ensure it is accurate. 

>    
[![ng](http://eagle.fish.washington.edu/cnidarian/skitch/Nightingales_-_Google_Fusion_Tables_1A424859.png)](https://www.google.com/fusiontables/DataSource?docid=13IxnqIZ_2Xpz_HE-3YcnU_egASYz9ZlA0PYIDGLN)

##Backup
* The Google Docs spreadsheet [*Next Gen Seq Library Database*](https://docs.google.com/spreadsheet/ccc?key=0AtV_gF766XZAdHRlUHJMd0k4S2RpdTZqbjFob2NJb2c&usp=sharing) is backed up on a regular basis? by downloading tab-delimited file and pushing to LabDocs Repository, with the file name `Next_Gen_Seq_Libraries.tsv`



##SRA Upload
