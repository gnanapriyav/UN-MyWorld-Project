###########################################################
#BY COUNTRY IMPACT
###########################################################

abscoef<-coef
abscoef<- mapply(x=abscoef, function(x) {return (abs(x))})
rownames(abscoef)<-rownames(coef)

CntryIndImp<-y%*%t(coef)


for (i in 1:215) {
	CntryIndImp[,i]<-(CntryIndImp[,i]-mean(CntryIndImp[,i]))/sd(CntryIndImp[,i])
}

CntryIndImpVal<-CntryIndImp-.5*abs(matrix) #need to add in the coeff sign to the matrix

#maybe just multiply ny coeff?

#APPROACH NUMBER TWO:

CntryIndImp<-y%*%t(abscoef)

for (i in 1:215) {
	CntryIndImp[,i]<-(CntryIndImp[,i]-mean(CntryIndImp[,i]))/sd(CntryIndImp[,i])
}
