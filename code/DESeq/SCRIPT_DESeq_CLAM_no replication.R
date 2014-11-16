#Check that the most recent version of R insatlled for Macs v.2.15.1
#check and set your working directory so that you can load files without designating the file location. I just open up the R script I want from the folder that I will be working in that also contains my data
getwd()

#install package DESeq using package installer if not already insatlled
source("http://bioconductor.org/biocLite.R")
biocLite("DESeq")

#load library
library( "DESeq" )

#read data into DESeq, needs to be in .txt form
CountData<- read.table("Manila_OA_Unique.txt",row.names=1, header=TRUE,)

# check that it is correct 
head (CountData)

# assign factors
Treatment <- factor( c("FOUR","THOUS") )

# create a new data set
cds <- newCountDataSet( CountData, Treatment )

# Estimate effective library size
LibrarySize <- estimateSizeFactors( cds )
sizeFactors( LibrarySize )

#estimate Dispersons without replication
Dispersons <- estimateDispersions( LibrarySize, method="blind", sharingMode="fit-only" )

# calculate differential gene expression 
DE <- nbinomTest( Dispersons, "FOUR", "THOUS" )

#check data
head (DE)

#plot log2 fold changes against base means 
plotDE <- function (DE)
	plot(
		DE$baseMean, 
		DE$log2FoldChange,
		log="x", pch=20, cex=.3,
		col = ifelse (DE$padj < .05, "red", "black"))
		
plotDE(DE)		

#plot histogram of p-values
hist(DE$pval, breaks=100, col="skyblue", border="slateblue", main="")

#export data into a tab deliminted txt file 
write.table(DE, "Clam_DESeq.txt", row.names = FALSE, sep="\t")
		
