setwd("~/Desktop/work/data/ccle_data")
rnaseq<-read.delim( 'CCLE_DepMap_18Q1_maf_20180207 (1).txt',header=TRUE)
regulatorynetwork<-read.delim('../Gene_regulators/Regulatory network.txt')
regulators<-as.character(unique(regulatorynetwork[,1]))
rnaseq_deleterious_mutation <- rnaseq[which(rnaseq$isDeleterious==TRUE),]
regulator_deleterious_mutation <- rnaseq_deleterious_mutation[which(rnaseq_deleterious_mutation$Hugo_Symbol%in%regulators),]
#a[['MTOR']]<-unique(as.character(rnaseq_deleterious_mutation[which((rnaseq_deleterious_mutation$Hugo_Symbol=='MTOR')),"Tumor_Sample_Barcode"]))
load("~/Desktop/work/data/ccle_data/copynumberbygene.Rdata")
load("~/Desktop/work/data/Gene_regulators/networklist.Rdata")
printcopynumber<-function(x,y){
  
  return(copynumber[which(copynumber$SYMBOL %in% x[[y]]),])}
printcopynumber(networklist,'A1BG')
a<-printcopynumber(networklist,'A1BG')
a[,c(mutated_regulator_cl[['A1BG']])]
for (a in regulators){
  mutated_regulator_cl[[a]]<-unique(as.character(rnaseq_deleterious_mutation[which((rnaseq_deleterious_mutation$Hugo_Symbol==a)),"Tumor_Sample_Barcode"]))
}
t<-unique(as.character(rnaseq_deleterious_mutation[which((rnaseq_deleterious_mutation$Hugo_Symbol=='A1BG')),"Tumor_Sample_Barcode"]))
copynumber_cl<-colnames(copynumber)
trunc_rdm<-regulator_deleterious_mutation[which(regulator_deleterious_mutation$Tumor_Sample_Barcode%in%copynumber_cl),]
mutated_regulator_cl<-list()
for (a in regulators){
  mutated_regulator_cl[[a]]<-unique(as.character(trunc_rdm[which((trunc_rdm$Hugo_Symbol==a)),"Tumor_Sample_Barcode"]))
}
regulatornetwork_with_copynumber_filterbycl<-list()
for (a in regulators){
  regulatornetwork_with_copynumber_filterbycl[[a]]<-printcopynumber(networklist,a)[,c('SYMBOL',mutated_regulator_cl[[a]])]
}
atm<-regulatornetwork_with_copynumber_filterbycl[['ATM']]
abcb1<-a

