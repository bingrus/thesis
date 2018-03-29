library(GSEABase)
slim_terms <- getOBOCollection("goslim_generic.obo")
library(GEOquery)
mydata<-getGEO(filename='data/GSE36133_series_matrix.txt.gz')
e<-exprs(mydata)
features<-fData(mydata)
rownames(e)<-features$ORF
library(GSVA)
library(org.Hs.eg.db)
library(GO.db)
xx <- as.list(org.Hs.egGO2ALLEGS)
goids <- xx[2:3]
gonames<-Term(GOTERM)
go_bp_children <- GOBPOFFSPRING$"GO:0008150"
slim_terms <- ids(slim_terms)[which(ids(slim_terms) %in% go_bp_children)]
slim_terms <- cbind(slim_terms, unname(gonames[match(slim_terms, names(gonames))]))
pathways <- xx[slim_terms[,1]]
pathways <- pathways[!is.na(names(pathways))]
names(pathways) <- unname(gonames[match(names(pathways), names(gonames))])
gogsva<-gsva(e,pathways,method=c('ssgsea'))
g<-as.data.frame(gogsva)
d<-t(g)
d_means<-colMeans(d)
par(mar=c(12,4,1,1),las=3)
boxplot(d[, order(d_means)], horizontal = FALSE, outline = FALSE,cex.axis=0.5,title='goslim ssgsea boxplot') 
title(main='CCLE goslim ssgsea boxplot')
