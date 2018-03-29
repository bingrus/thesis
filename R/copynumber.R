load("~/Desktop/work/data/analysis_on_mutation/copynumberbygene.Rdata")
load("~/Desktop/work/data/analysis_on_mutation/regulatornetwork_nomutation_copynumber_filterbycl.Rdata")
load("~/Desktop/work/data/analysis_on_mutation/regulatorynetwork_with_copynumber_filter.Rdata")
qu<-function(x){quantile(x,probs = c(.025,.975))}
copynumber_quantile<-apply(copynumber[,-(1:5)],1,qu)
copynumber_quantile<-t(copynumber_quantile)
row.names(copynumber_quantile)<-copynumber[,2]
a<-regulatornetwork_nomutation_copynumber_filterbycl[['ATM']]
a_m<-regulatornetwork_with_copynumber_filterbycl[['ATM']]
cp<-function(x){which(as.numeric(x[-1])<=copynumber_quantile[as.character(x[[1]]),1])}
b<-apply(a,1,cp)
names(b)<-a[,1]
b_m<-apply(a_m,1,cp)
names(b_m)<-a_m[,1]
cp_up<-function(x){which(as.numeric(x[-1])>=copynumber_quantile[as.character(x[[1]]),2])}
abcb1<-regulatornetwork_nomutation_copynumber_filterbycl[['ABCB1']]
abcb1_m<-regulatornetwork_with_copynumber_filterbycl[['ABCB1']]
# abcb1 compare with qq0.025
abcb1_d<-apply(abcb1,1,cp)
names(abcb1_d)<-abcb1[,1]
abcb1_m_d<-apply(abcb1_m,1,cp)
names(abcb1_m_d)<-abcb1_m[,1]
# abcb1 compare with qq0.975
abcb1_u<-apply(abcb1,1,cp_up)
names(abcb1_u)<-abcb1[,1]
abcb1_m_u<-apply(abcb1_m,1,cp_up)
names(abcb1_m_u)<-abcb1_m[,1]