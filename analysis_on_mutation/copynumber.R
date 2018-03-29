load("~/Desktop/work/analysis/analysis_on_mutation/copynumberbygene.Rdata")
load("~/Desktop/work/data/regulatornetwork_nomutation_copynumber_filterbycl.Rdata")
load("~/Desktop/work/regulatorynetwork_with_copynumber_filter.Rdata")
qu<-function(x){quantile(x,probs = c(.025,.975))}
copynumber_quantile<-apply(copynumber[,-(1:5)],1,qu)
copynumber_quantile<-t(copynumber_quantile)
row.names(copynumber_quantile)<-copynumber[,2]
#a<-regulatornetwork_nomutation_copynumber_filterbycl[['ATM']]
#a_m<-regulatornetwork_with_copynumber_filterbycl[['ATM']]
cp_o<-function(x){which(as.numeric(x[-1])<=copynumber_quantile[as.character(x[[1]]),1])}
#b<-apply(a,1,cp)
#names(b)<-a[,1]
#b_m<-apply(a_m,1,cp)
#names(b_m)<-a_m[,1]
cp_up_o<-function(x){which(as.numeric(x[-1])>=copynumber_quantile[as.character(x[[1]]),2])}
abcb1<-regulatornetwork_nomutation_copynumber_filterbycl[['ABCB1']]
abcb1_m<-regulatornetwork_with_copynumber_filterbycl[['ABCB1']]

# abcb1 compare with qq0.025
abcb1_d_o<-apply(abcb1,1,cp_o)
names(abcb1_d_o)<-abcb1[,1]
abcb1_m_d_o<-apply(abcb1_m,1,cp_o)
names(abcb1_m_d_o)<-abcb1_m[,1]

# abcb1 compare with qq0.975
abcb1_u_o<-apply(abcb1,1,cp_up_o)
names(abcb1_u_o)<-abcb1[,1]
abcb1_m_u_o<-apply(abcb1_m,1,cp_up_o)
names(abcb1_m_u)<-abcb1_m[,1]
