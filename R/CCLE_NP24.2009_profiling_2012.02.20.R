createdot<-function(x){
  x<-as.numeric(x)
  data.frame(seq(from = x[3], to = x[4], by = x[7])[-1],rep(x[6],
              length(seq(from = x[3], to = x[4], by = x[7])[-1])))
  }
plotcopynumber<-function(x){
t <-createdot(x[1,])
for (i in c(2:nrow(x))){ t<-rbind(t,createdot(x[i,]))}}
