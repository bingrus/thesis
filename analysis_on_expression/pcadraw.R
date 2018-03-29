acl<-pd[which(pd$characteristics_ch1=='primary site: haematopoietic_and_lymphoid_tissue'),]
aclgeo<-as.character(acl$geo_accession)
ax<-mx[which(rownames(mx) %in% aclgeo),1:2]
points(ax,col='blue')
lu<-pd[which(pd$characteristics_ch1=='primary site: lung'),]
lugeo<-as.character(lu$geo_accession)
lx<-mx[which(rownames(mx) %in% lugeo),1:2]
points(lx,col='green')
oo<-pd[which(pd$characteristics_ch1=='primary site: ovary'),]
oogeo<-as.character(oo$geo_accession)
ox<-mx[which(rownames(mx) %in% oogeo),1:2]
points(ox,col='yellow')
cn<-pd[which(pd$characteristics_ch1=='primary site: central_nervous_system'),]
cngeo<-as.character(cn$geo_accession)
cnx<-mx[which(rownames(mx) %in% cngeo),1:2]
points(cnx,col='red')
bb<-pd[which(pd$characteristics_ch1=='primary site: breast'),]
bbgeo<-as.character(bb$geo_accession)
bx<-mx[which(rownames(mx) %in% bbgeo),1:2]
points(bx,col='orange',pch=19)
sk<-pd[which(pd$characteristics_ch1=='primary site: skin'),]
skgeo<-as.character(sk$geo_accession)
sx<-mx[which(rownames(mx) %in% skgeo),1:2]
points(sx,col='purple')
li<-pd[which(pd$characteristics_ch1=='primary site: large_intestine'),]
ligeo<-as.character(li$geo_accession)
lix<-mx[which(rownames(mx) %in% ligeo),1:2]
points(lix,col='pink')
bl<-pd[which(pd$characteristics_ch1=='primary site: autonomic_ganglia'),]
blgeo<-as.character(bl$geo_accession)
bx<-mx[which(rownames(mx) %in% blgeo),1:2]
points(bx,col='lightblue',pch=19)
bol<-pd[which(pd$characteristics_ch1=='primary site: bone'),]
bolgeo<-as.character(bol$geo_accession)
box<-mx[which(rownames(mx) %in% bolgeo),1:2]
points(box,col='gray',pch=19)
ul<-pd[which(pd$characteristics_ch1=='primary site: urinary_tract'),]
ulgeo<-as.character(ul$geo_accession)
ux<-mx[which(rownames(mx) %in% ulgeo),1:2]
points(ux,col='yellow',pch=24)
