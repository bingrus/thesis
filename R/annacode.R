# Anna's analysis on copy numbers
library(reshape2)
CNV_cell_lines_o <- read.table('~/desktop/work/data/CCLE/CCLE_copynumber_byGene_2013-12-03.txt',
                              header=TRUE, sep="\t")
CNV_cell_lines <- CNV_cell_lines_o
CNV_cell_lines$EGID <- NULL
CNV_cell_lines$CHR <- NULL
CNV_cell_lines$CHRLOC <- NULL
CNV_cell_lines$CHRLOCEND <- NULL
# use the reshape very helpful in tabel analysis
CNV_cell_lines <- melt(CNV_cell_lines)

colnames(CNV_cell_lines) <- c("Regulator", "Cell_line", "CNV")

blood_cell_lines <- CNV_cell_lines[grep("HAEMATOPOIETIC_AND_LYMPHOID_TISSUE", CNV_cell_lines$Cell_line),"Cell_line"]

CNV_cell_lines <- CNV_cell_lines[!(CNV_cell_lines$Cell_line %in% blood_cell_lines),]

plot(density(CNV_cell_lines$CNV))

#del_cul was 0.1 and amp_cut was 0.9
del_cut <- quantile(CNV_cell_lines$CNV[CNV_cell_lines$CNV < 0], 0.025)
amp_cut <- quantile(CNV_cell_lines$CNV[CNV_cell_lines$CNV > 0], 0.975)

to_keep <- ifelse(CNV_cell_lines$CNV >= amp_cut | CNV_cell_lines$CNV <= del_cut, "Keep", "Dont")

CNV_cell_lines$Keep <- to_keep
CNV_cell_lines_top <- CNV_cell_lines[CNV_cell_lines$Keep == "Keep",]
CNV_cell_lines_top$Keep<-NULL

load("~/Desktop/work/data/regulatornetwork_nomutation_copynumber_filterbycl.Rdata")
load("~/Desktop/work/data/regulatorynetwork_with_copynumber_filter.Rdata")

cp_down<-function(x){which(as.numeric(x[-1])<=del_cut)}
cp_up<-function(x){which(as.numeric(x[-1])>=amp_cut)}

abcb1<-regulatornetwork_nomutation_copynumber_filterbycl[['ABCB1']]
abcb1_m<-regulatornetwork_with_copynumber_filterbycl[['ABCB1']]

# abcb1 compare with qq0.025
abcb1_d<-apply(abcb1,1,cp_down)
names(abcb1_d)<-abcb1[,1]
abcb1_m_d<-apply(abcb1_m,1,cp_down)
names(abcb1_m_d)<-abcb1_m[,1]

# abcb1 compare with qq0.975
abcb1_u<-apply(abcb1,1,cp_up)
names(abcb1_u)<-abcb1[,1]
abcb1_m_u<-apply(abcb1_m,1,cp_up)
names(abcb1_m_u)<-abcb1_m[,1]
