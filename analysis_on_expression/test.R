setwd('/Users/ll/Desktop/work/bioinformatics-core-shared-training-microarray-analysis-8a29c27')
library(GEOquery)
mydata<-getGEO(filename='data/GSE36133_series_matrix.txt.gz')
mydata
e<-exprs(mydata)
boxplot(e,outline=FALSE)
colnames(pData(mydata))
pd<-pData(mydata)
View(pd)
features<-fData(mydata)
library(ggfortify)
e1<-t(e)
autoplot(prcomp(e1))
mx<-m$x
neurob<-pd[which(pd$characteristics_ch1.1=='histology: neuroblastoma'),]
neurobgeo<-as.character(neurob$geo_accession)
plot(mx[,1],mx[,2])
nmx<-mx[which(rownames(mx) %in% neurobgeo),1:2]
points(nmx,col='red')
library(org.Hs.eg.db)
library(annotate)
ent<-as.character(features$ORF)
genename<-getSYMBOL(ent,data='org.Hs.eg')
library(hgu133plus2hsentrezg.db)
select(hgu133bhsentrezg.db, as.character(features$ID), c("SYMBOL","ENTREZID", "GENENAME")) ##  This is just a trying example
OUT <- select(hgu133plus2hsentrezg.db,keys= as.character(features$ID), columns=c("SYMBOL", "ENTREZID", "GENENAME"))
keytypes(hgu133bhsentrezg.db)
