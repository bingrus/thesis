setwd('/Users/ll/Desktop/work/bioinformatics-core-shared-training-microarray-analysis-8a29c27')
library(GEOquery)
mydata<-getGEO(filename='data/GSE36133_series_matrix.txt.gz')
mydata
e<-exprs(mydata)
features<-fData(mydata)
rownames(e)<-features$ORF
library(GSVA)
library(GSEABase)
keggset <- getGmt("/Users/ll/Desktop/work/bioinformatics-core-shared-training-microarray-analysis-8a29c27/gset/c2.cp.kegg.v6.0.entrez.gmt.txt")
reactset <- getGmt("/Users/ll/Desktop/work/bioinformatics-core-shared-training-microarray-analysis-8a29c27/gset/c2.cp.reactome.v6.0.entrez.gmt.txt")
kgsva<-gsva(e,keggset,method=c('ssgsea'))
regsva<-gsva(e,reactset,method=c('ssgsea'))