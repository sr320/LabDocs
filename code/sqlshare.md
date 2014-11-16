#SQLShare

##Rename columns in a table   
- Use "Edit Dataset" button in SQLShare    
- After executing the query, press the "Update Dataset" button below the query window.   
- Use the "as" function.   


Example:

```
SELECT [table1].column1 AS newcolumnname1, [table1].column2 AS newcolumnname2
FROM [table1]
```

Code explanation:    
SELECT: Standard SQL to identify the source information you want to work with.   
[table1]: This is the name of your source table.   
.column1: Specifies which column in [table1] to act upon. Note: This is the actual name of the column (e.g. if the column was named "SeqID", you'd have .SeqID; not .column1)   
as: Instructs SQL to rename specified column from [table1]   
newcolumnname1: Assigns your desired name to the column.   
,: Allows you to separate multiple commands. Can be used extensively to    allow for multiple commands in a single line. In this example, it is used to rename two columns in [table1].   
FROM: Standard SQL to identify location of source data.    

Practical application of the "as" function:
Example:

``` 
SELECT GeneCGS+CDS_CGs AS Total_CGs
FROM Stats_mRNA_CGs
``` 
Code explanation:

This adds, mathematically, the numerical content of two columns (GeneCGS and CDS_CGs) that exist in the Stats_mRNA_CGs table and names the resulting column "Total_CGs".




##Count the number of terms in a column

```
SELECT column_name, COUNT(column_name)
  FROM your_table_name
 GROUP BY column_name
 ```
 
Code explanation:

SELECT: Standard SQL to identify the source information you want to work with.
column_name: Name of the column with the terms in it that you would like to count.
count(column_name): For our purposes, this will count the number of same terms in the specified column. However, the function is actually counting the number of rows in the table that contain the same terms in the specified column.   
FROM: Standard SQL to identify location source of data.
GROUP BY: Groups the data by the terms in the specified column.

###Conventional Joining of tables (Keeping everything in first table)  
```
SELECT * FROM [sr320@washington.edu].[table_QPX_Experiment_UniqueReads_simple.txt]
  LEFT JOIN [sr320@washington.edu].[QPX_CLC_experiment_Kal_tab.txt]
  ON [sr320@washington.edu].[table_QPX_Experiment_UniqueReads_simple.txt]."Feature ID"=[sr320@washington.edu].[QPX_CLC_experiment_Kal_tab.txt]."Feature ID"
  ```
 
Notes:


###SQL Share Python API
Single file upload  

```
python singleupload.py sr320@washington.edu "API key" /Users/sr320/Desktop/J_contignetworks.txt Jaketable
```

Notes: "API key" is a unique alpha-numeric code. more at
http://escience.washington.edu/get-help-now/sqlshare-python-api


