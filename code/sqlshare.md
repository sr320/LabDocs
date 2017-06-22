#  SQLShare
 
 
 Below are examples of some standard queries. In some examples datasets are actual datasets in SQLShare, and in other cases the code reflects a generic example. In the latter instances `[user].[table_]` is used to indicate a particular dataset.
 
 ---
 
###  Only keep rows where value is not blank
 
 
     Where [column_name] <> ' '
 
 ---
 
###  Wildcards
 
 
 Wildcard  |  Description
 --------- | ---------
 % |	A substitute for zero or more characters
 _	| A substitute for a single character
 [charlist]	 | Sets and ranges of characters to match
 [^charlist] or [!charlist] | Matches only a character NOT specified within the brackets
 
 
 
 example
 
     SELECT * FROM [emmats@washington.edu].[bact detection peptides and proteins]
     Where protein like '%RUEPO%'
 
 
 
 ---
 
###  Reorder columns in an existing table (Use the "Edit dataset" button in SQLShare)
 ```sql
 SELECT
 [column_name4],
 [column_name2],
 [column_name1],
 [column_name3]
 FROM 
 [table]
 ```
 
 After running this query in SQLShare, press the "Update dataset" button beneath the Dataset Preview window.
 
 Code explanation:
 The order that you write out the columns determines their order in the result of the query. 
 
 ---
 
###  Sort a file based on values in a column
     SELECT *, ROW_NUMBER ()
     OVER (PARTITION BY [col 1] ORDER BY [col 2] DESC) AS [new col name]
     FROM [file name]
 
 Code explanation
 - If common values are in column 1 (i.e. redundant values that you want to group together), then the PARTITION command will create groups within that column of those values.  If this is not necessary for your dataset, you can just leave this part out.
 - The data in column 2 are sorted in descending order. Since this code also has PARTITION BY, the sorting of column 2 data happens just within the groups formed within column 1.
 - AS creates a new column with the rank of values from column 2. 
 
###  Keep values that have a certain rank (see above for ranking values)
 Your input file should have a column with ranks.  This example chooses the top 3 values from your dataset (i.e. ranks 1,2, and 3).
 ```
 SELECT * FROM [file name]
 WHERE [column with ranks] <=3
 ```
 Code explanation 
 - takes all columns in your file that have a rank of at least 3
 
###  Sum values across data columns
 ```
 SELECT [col 1], [col 2], [data col1]+[data col2] AS [new col name]
 FROM [file name]
 ```
 Code explanation
 - For each entry (defined by values in columns 1 and 2), sum the data values from the 2 data columns and put them in a new column
 
###  Choose only entries that occur once
 You may want to use this command when you are only interested in a certain value/data entry that is specific (i.e. does not occur multiple times in your dataset)
 ```
 SELECT * FROM [file name] WHERE [col of interest from file] IN
 (SELECT [col of interest]
 FROM [file name]
 GROUP BY [col of interest]
 HAVING COUNT (*) = 1)
 ```
 Code explanation
 - The subquery, within parentheses, chooses only those values in your column of interest that occur one time.
 - The main query makes those values that occur one time into a new file.
 - Instead of = 1 you could also use < 2
 
###  Keep only unique entries in a file (i.e. Remove duplicate entries)
 ```
 SELECT DISTINCT [col 1 name], [col 2 name]
 FROM [file name]
 ```
 Code explanation
 - The new file will only have unique combinations of values in columns 1 and 2 (redundancies will be removed)
 
###  Join files on top of each other and add column denoting file origination 
 ```
 SELECT
 1 AS fileID, *
 FROM [user].[table1]
 UNION ALL
 SELECT
 2 AS fileID, *
 FROM [user].[table2]
 ```
 Code explanation
 - "fileID" is the name of the new column.  A 1 in that column means the data in that row came from file 1, a 2 means it came from file 2.
 - The input files for this command had identical structures 
 
###  From files joined on top of each other (see above) create file with data in columns
 This command will create a new file that has 1 column of identifiers (or row names) and then 2 columns of data from the 2 files that were originally joined (so that each file's data has its own column).
 ```
 SELECT [col 1], [col 2],
 SUM (CASE WHEN fileID=1 then [data column] else 0 end)
 AS data1,
 SUM (CASE WHEN fileID=2 then [data column] else 0 end)
 AS data2
 FROM [file name]
 GROUP BY [col 1], [col 2]
 ```
 Code explanation
 - For each entry in columns 1 and 2 (which identify the data), 2 new columns will be created: data1 and data2
 - data1 and data2 are sourced from the data column in the original file.  The values are only filled into the new data1 and data2 columns if there is data in the original data column for that entry.  Data is entered into the new data columns based on the original file's value in the fileID column, i.e. if there is a 1 in the fileID column then the data column value will go in the new data1 column.
 
 --- 
 
###  Rename columns in a table
 - Use "Edit Dataset" button in SQLShare
 - After executing the query, press the "Update Dataset" button below the query window.
 - Use the "as" function.
 
 
 Example:
 
     SELECT 
     [column1] AS [newcolumnname1],   
     [column2] AS [newcolumnname2]
     FROM [table1]
 
 Code explanation:
 
 _SELECT_ -- Standard SQL to identify the source information you want to work with.
 
 _[column1]_ -- Specifies which column in [table1] to act upon. Note: This is the actual name of the column (e.g. if the column was named "SeqID", you'd have SeqID; not column1)
 
 _AS_ -- Instructs SQL to rename specified column from [table1]
 
 _[newcolumnname1]_ -- Assigns your desired name to the column.
 
 _,_ -- Allows you to separate multiple commands. Can be used extensively to allow for multiple commands in a single line. In this example, it is used to rename two columns in [table1].
 
 _FROM_ -- Standard SQL to identify location of source data.
 
 _[table1]_ -- This is the name of your source table.
 
 <br>
 Practical application of the "AS" function:
 Example:
 
     SELECT GeneCGS+CDS_CGs AS Total_CGs
     FROM [sr320@washington.edu].[Stats_mRNA_CGs]
  
 Code explanation:
 
 This adds, mathematically, the numerical content of two columns (GeneCGS and CDS_CGs) that exist in the Stats_mRNA_CGs table and names the resulting column "Total_CGs".
 
 ---
 
###  Count the number of terms in a column
 
     SELECT [column_name], COUNT([column_name])
     FROM [user].[table]
     GROUP BY [column_name]
 Code explanation:
 
 _SELECT_ -- Standard SQL to identify the source information you want to work with.
 
 _[column_name]_ -- Name of the column with the terms in it that you would like to count.
 
 _COUNT([column_name])_ -- For our purposes, this will count the number of same terms in the specified column. However, the function is actually counting the number of rows in the table that contain the same terms in the specified column.
 
 _FROM_ -- Standard SQL to identify location source of data.
 
 _GROUP BY_ -- Groups the data by the terms in the specified column.
 
 ---
 
###  Conventional Joining of tables
 (Keeping everything in first table)
 
     SELECT * 
     FROM [table1]
     LEFT JOIN [table2]
     ON [table1].[column_of_interest]=[table2].[column_of_interest]
 
 Code explanation:
 
 _SELECT_ -- Standard SQL to identify the source information you want to work with.
 
 _*_ -- Asterisk represents all columns in [table1].  User could replace asterisk with specific columns in [table1], if desired.  Separate specific columns with a comma.
 
 _FROM_ -- Standard SQL to identify location source of data.
 
 _[table1]_ -- Data table containing values to be matched to.
 
 _LEFT JOIN_ -- Specifies SQLShare to keep all rows in [table2] that match those specified in [table1].
 
 _[table2]_ --  Data table containing values to match from.
 
 _ON_ -- Required as part of the LEFT JOIN command
 
 _[table1].[column_of_interest]=[table2].[column_of_interest]_ -- Identifies which column in each table contains the appropriate data to be joined together
 
 
 NOTE:  The code above can be simplified using the WHERE command.  This command can be a bit more intuitive than the LEFT JOIN.  Here's the same query as above, rewritten using the WHERE command instead of LEFT JOIN:
 
     SELECT * 
     FROM [table1]
     WHERE [table1].[column_of_interest]=[table2].[column_of_interest]
 
 ---
 
###  Counting Records
     SELECT COUNT (*)
     FROM
     (
     SELECT 
     [column1],
     [column2],
     FROM [table1]
     ) alias  -- note: needs alias
 
 Code explanation:
 
 _SELECT_ -- Standard SQL to identify the source information you want to work with.
 _COUNT (*)_ -- Specifies which columns to count.  Asterisk means "all columns"
 _FROM_ -- Specifies the table containing the source information.  In this example, we will be pulling the data from a subquery, which is what is contained in the parentheses.  The subquery specifies which columns to select from [table1].  Using a single asterisk in place of specific column names will specify all columns.  
 _alias_ -- The subquery requires an alias in order for the outside SELECT statement to execute properly.  The alias can be any alphabet character(s).  In this example, we used the literal word "alias" as the alias.  However, we could have also used "x", or "pizza", or "b" instead of the word "alias".
 
 
 ---
 
###  Operate depending on column value (case when)
     SELECT
     cd.Column9 as seqname,  
     cd.Column2 as source,  
     cd.Column3 as feature, 
    
     Case when Column7 = '+'
     then Column4 - mRNA_start + 1
     Else mRNA_end - Column4 + 1
     END as start,
   
      
     FROM 
     [sr320@washington.edu].[CDS GFF with Gene start and stop] cd
 
 
 ---
 
###  Operate depending on column value (case when) >2 values
 ```sql
 SELECT CAS001,
 CASE WHEN CAS001=2 THEN 'NM'
      WHEN CAS001=1 THEN 'M'
      ELSE 'U' END
 AS CAS001MethStat
 FROM [emmats@washington.edu].[summed presence absence fragment peaks]
 ```
 
 
###  Rename columns in a table   
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
 
 
 
 
###  Count the number of terms in a column
 
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
 
 ---
 
 
###  SQL Share Python API
 Single file upload  
 
 ```
 python singleupload.py sr320@washington.edu "API key" /Users/sr320/Desktop/J_contignetworks.txt Jaketable
 ```
 
 Notes: "API key" is a unique alpha-numeric code. more at
 http://escience.washington.edu/get-help-now/sqlshare-python-api
 
 
