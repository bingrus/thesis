dat<-read.csv("http://faculty.missouri.edu/huangf/data/mvnotes/READING120n.csv")
str(dat)
bart<-function(dat){
  R<-cor(dat)
  p<-ncol(dat)
  n<-nrow(dat)
  chi2<- -((n-1)-((2*p)+5)/6)*log(det(R))
  df<-(p*(p-1)/2)
  crit<-qchisq(.95,df)
  p<-pchisq(chi2,df,lower.tail=F)
  cat("Bartlett's test of sphericity: X2(",
  df,")=",chi2,", p=",
  round(p,3),sep="")
  
}