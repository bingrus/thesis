load("~/Desktop/work/data/CCLE/new_seg_p.Rdata")
createdot<-function(x){
  x<-as.numeric(x)
  data.frame(seq(from = x[3], to = x[4], by = x[7])[-1],rep(x[6],
              length(seq(from = x[3], to = x[4], by = x[7])[-1])))
  }
plotcopynumber<-function(x){
t <-createdot(x[1,])
for (i in c(2:nrow(x))){ t<-rbind(t,createdot(x[i,]))}
c <- paste(as.character(x[1,1]),'chromosome',as.character(x[1,2]),sep = ' ')
plot(t,main= c,ylim=c(-4, 4),xlab = '',ylab = '')
}
plot_all<-function(x){
  chromosomelist = c(1:22,'X','Y')
  for (i in chromosomelist){
    p<-subset(new_seg_p,CCLE_name== x & Chromosome== i)
    plotcopynumber(p)
  }
}
#plot_all('LOUNH91_LUNG')
plot_all('1321N1_CENTRAL_NERVOUS_SYSTEM')
  