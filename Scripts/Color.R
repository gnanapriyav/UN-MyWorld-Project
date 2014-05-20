###########################################################
#COLOR
###########################################################

clrdata <- read.csv("UNColorScheme.csv")


clrcoef<- coef 
clrcoef$Indicator.Code<-row.names(clrcoef)

for (i in 1:215) {
	clrcoef$coefmax[i]<-as.numeric(sort(abs(clrcoef[i,1:16]),partial=1)[16])
	clrcoef$coefmax2[i]<-as.numeric(sort(abs(clrcoef[i,1:16]),partial=2)[15])
	clrcoef$maxname[i]<-colnames(sort(abs(clrcoef[i,1:16]),partial=1)[16])
	clrcoef$max2name[i]<-colnames(sort(abs(clrcoef[i,1:16]),partial=2)[15])
}

clrcoef$maxname<-as.factor(clrcoef$maxname)
clrcoef$max2name<-as.factor(clrcoef$max2name)

clrcoef<-merge(clrcoef,clrdata,by.x=c("maxname"),by.y=c("Priority_Code"),all=TRUE)
clrcoef<-merge(clrcoef,clrdata,by.x=c("max2name"),by.y=c("Priority_Code"),all=TRUE)

clrcoef$alpha<-clrcoef$coefmax2/(clrcoef$coefmax+clrcoef$coefmax2)

clr<-mixcolor(clrcoef$alpha,RGB(clrcoef$r.x,clrcoef$g.x,clrcoef$b.x),RGB(clrcoef$r.y,clrcoef$g.y,clrcoef$b.y))
clrcoef[31:33]<-coords(as(clr,"RGB"))

names(clrcoef)[names(clrcoef)=='V31']<-'R'
names(clrcoef)[names(clrcoef)=='V32']<-'G'
names(clrcoef)[names(clrcoef)=='V33']<-'B'

indclr<-cbind(clrcoef$Indicator.Code,clrcoef$R,clrcoef$G,clrcoef$B)

colnames(indclr)<-c("Indicator.Code","R","G","B")

write.table(indclr,file="~/mygit/UN-MYWorld-Project/Data/indclr.csv",sep=",")






