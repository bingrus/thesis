setwd("~/Desktop/work/data/ccle_data")
rnaseq<-read.delim( 'CCLE_DepMap_18Q1_maf_20180207 (1).txt',header=TRUE)
setwd("~/Desktop/work/data/ccle_data")
rnaseq<-read.delim( 'CCLE_DepMap_18Q1_maf_20180207 (1).txt',header=TRUE)
load("~/Desktop/work/data/Gene_regulators/regulator_mutation.Rdata")
genename<-mutation$Hugo_Symbol
genename<-as.character(genename)
rnaseq_cl<-rnaseq[which(rnaseq$Hugo_Symbol%in%genename),]
View(rnaseq_cl)
rnaseq_cl_nos<-rnaseq_cl[which(rnaseq_cl$Variant_Classification!='Silent'),]
View(rnaseq_cl_nos)
cellllinename<-rnaseq_cl_nos$Tumor_Sample_Barcode
cellllinename<-as.character(cellllinename)
cellllinename<-unique(cellllinename)
m<-list()
n<-1
for (i in cellllinename){
  a<-as.character(rnaseq_cl_nos[which(rnaseq_cl_nos$Tumor_Sample_Barcode==i),1])
  m[n]<-list(unique(a))
  n<-n+1
  }
cl_regulator<-m
t<-list()
n<-1
for (i in genename){
  a<-as.character(rnaseq_cl_nos[which(rnaseq_cl_nos$Hugo_Symbol==i),16])
  t[n]<-list(unique(a))
  n<-n+1
}
k<-list()
n<-1
for (i in genename){
  a<-as.character(network[which(network$Regulator==i),2])
  k[n]<-list(unique(a))
  n<-n+1
}
mylist<-function(x,y,c,d){
  p<-list()
  n<-1
  for (i in x){
    a<-as.character(y[which(c==i),d])
    t[n]<-list(unique(a))
    n<-n+1
  }
}
mylist<-function(x,y,c,d){
  p<-list()
  n<-1
  for (i in x){
    a<-as.character(y[which(c==i),d])
    p[n]<-list(unique(a))
    n<-n+1
  }
  names(p)<-x
  return(p)
}
regulator_cl_D<-mylist(genename,rnaseq_cl_nos_D,rnaseq_cl_nos_D$Hugo_Symbol,16)
networkall<-networkall[!is.na(names(networkall))]
searchlist<-function(x,y,z){
  return(y[which(z==x),])
}
printcopynumber<-function(x,y){
  
  return(copynumber[which(copynumber$SYMBOL %in% x[[y]]),])}
mutgene<-names(cl_with_mutation)
t<-data.frame(printcopynumber(networklist,'ABCC2'))
m<-data.frame('ABCC2')
colnames(m)<-'regulator'
t<-cbind(m,t)
for (i in mutgene){
  a<-printcopynumber(cl_with_mutation_gene,i)
  m<-data.frame(rep(i,nrow(a)))
  colnames(m)<-'regulator'
  a<-cbind(m,a)
  t<-rbind(t,a)
}
names(t)<-networkgene
a<-copynumber[which(copynumber$SYMBOL %in% cl_with_mutation_gene[['ALB']]),]
regulator_cl_D[networkgene]
