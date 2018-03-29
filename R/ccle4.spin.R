mutation_o<-read.delim('~/Desktop/work/data/CCLE/CCLE_DepMap_18Q1_maf_20180207 (1).txt')
mutation<-mutation_o
mutation_s<-mutation_o[which(is.na(mutation_o$ExAC_AF)),]
mutation_s<-mutation_s[which(mutation_s$isDeleterious == 'TRUE'),]
mutation_s_w<-mutation_s
mutation_s_w<-data.frame(mutation_s$Hugo_Symbol,mutation_s$Tumor_Sample_Barcode)
#library(reshape2)
genelist<-as.character(unique(mutation_s_w[,1]))
mutationlist<-as.character(mutation_s_w[which(mutation_s_w$mutation_s.Hugo_Symbol=='MTOR'),2])
rs<-function(x){
  c<-as.character(mutation_s_w[which(mutation_s_w$mutation_s.Hugo_Symbol==x),2])
  return(c)
  }
a<-lapply(genelist,rs)
names(a)<-genelist
mutatedcelllines<-a
b<-lapply(mutatedcelllines,length)
mutatedcelllines_num<-as.data.frame(b)
mutatedcelllines_num<-t(mutatedcelllines_num)
colnames(mutatedcelllines_num)<-c('freq')
plot(mutatedcelllines_num)
hist(mutatedcelllines_num)
plot(density(mutatedcelllines_num))
