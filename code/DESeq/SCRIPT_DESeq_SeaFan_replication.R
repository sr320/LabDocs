library( "DESeq" )
CountData<- read.table("AC_SC_readCountsDESeq.txt",row.names=1, header=TRUE,)
head (CountData)
conds <- c(rep("AC",4), rep("SC",4))
conds
cds <- newCountDataSet( CountData, conds )
head (counts (cds))
LibrarySize <- estimateSizeFactors( cds )
sizeFactors( LibrarySize )
head( counts( LibrarySize, normalized=TRUE ) )
Disp <- estimateDispersions( LibrarySize )
str( fitInfo(Disp) )
plotDispEsts <- function (Disp)
{
	plot(
		rowMeans( counts(Disp, normalized=TRUE)),
		fitInfo(Disp)$perGeneDispEsts,
		pch = '.', log="xy")
		xg <-10^seq(-.5, 5, length.out=300)
		lines (xg, fitInfo(Disp)$dispFun(xg), col="red")
}
plotDispEsts(Disp)
head ( fData(Disp))
str(fitInfo(Disp))
DE <- nbinomTest( Disp, "AC", "SC" )
head (DE)
plotDE <- function (DE)
	plot(
		DE$baseMean, 
		DE$log2FoldChange,
		log="x", pch=20, cex=.3,
		col = ifelse (DE$padj < .05, "red", "black"))
plotDE(DE)
hist(DE$pval, breaks=100, col="skyblue", border="slateblue", main="")
write.table(DE, "AC_SC_DESeq.txt", row.names = FALSE, sep="\t")