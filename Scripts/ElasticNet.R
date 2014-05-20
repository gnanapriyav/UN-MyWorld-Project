###########################################################
#FINAL DATA MUNGING
###########################################################

#checking order before converting to matrix
priorityfinal<-priorityfinal[order(priorityfinal$Country.Code),]
X<-X[sort(X$Country.Code)]

#creating new matrix, dropping country names
matrix<-Xsort[4:218]

####################
#FOR X:
####################
#transform to matrix
matrix<-as.matrix(matrix)
#set rownames to countrycode
rownames(matrix)<-Xsort$Country.Code

#normalize
for (i in 1:215) {
	matrix[,i]<-(matrix[,i]-mean(matrix[,i]))/sd(matrix[,i])
}

####################
#FOR Y:
####################
#transform to matrix
y=as.matrix(priorityfinal[4:19])
#set row names to countrycode
rownames(y)<-priorityfinal$Country.Code

#normalize
for (i in 1:16) {
	y[,i]<-(y[,i]-mean(y[,i]))/sd(y[,i])
}




###########################################################
#ELASTIC NET
###########################################################

library(elasticnet)


#PLOTTING IS TOO SLOW: ONLY SHOW THIS ONCE
#obj.enet1=enet(matrix,pr1,lambda=.5)
#plot(obj.enet1, use.color=TRUE)


#creating a 16 X 215 MATRIX OF COEFFICIENTS: [INDICATOR, PRIORITY]
#each cell represents the impact of that variable on the priority

coef<-matrix(,nrow=215,ncol=0)
#setting row names to indicator names
indnames<-head(indicators[c("Indicator.Code","Indicator.Name")],164)
indnames<-indnames[order(indnames$Indicator.Code),]
EODBnames<-cbind(names(EODB[4:54]),'NA')
colnames(EODBnames)<-c("Indicator.Code","Indicator.Name")
indnames<-rbind(indnames,EODBnames)

#add in indicator names
coef<-cbind(indnames[2])
rownames(coef)<-colnames(matrix)

#for every priority
for (i in 1:16) {
	#new dependent variable
	pr<-y[,i]

	#run the elastic net model
	en.model=enet(matrix,pr,lambda=.5,intercept=FALSE)

	#compute k-fold cross validation error curve to find the optimal threshold
	obj.cv=cv.enet(matrix,pr,lambda=.5,s=seq(0.1,1,length=50),plot.it=FALSE,
		mode="fraction",trace=FALSE,max.steps=80)

	#using the optimal threshold, determine the s: beta/max(beta)
	s.opt=obj.cv$s[which.min(obj.cv$cv)]
	#finds coefficient matrix using optimal s value
	coeftmp=predict(en.model,s=s.opt,type="coefficients",mode="fraction")

	#bind on the new coefficients to our matrix
	coef<-cbind(coef,coeftmp$coefficients)

}

#setting names for columns
prnames<-names(priorityfinal[4:19])
prnames<-gsub("col","priority",prnames)

colnames(coef)[2:17]<-prnames


#final output
write.table(coef,file="~/mygit/UN-MYWorld-Project/Data/coefmatrix.csv",sep=",")



###########################################################
#FINDING PATTERNS
###########################################################

#PRELIMINARY STATS
#saved in excel: ElasticNetResults.xls
#priority results
priorityresults<-mapply(x=coef[2:17],function(x) {return (length(which(x!=0)))}) #no of variables in model
priorityresults<-cbind(priorityresults,colMeans(coef[2:17])) #Mean of coefficients
priorityresults<-cbind(priorityresults, colMedians(coef[2:17])) #Standard deviation of coefficients
priorityresults<- cbind(priorityresults,rowSums(coef[2:17]))
colnames(priorityresults)<-c("Indicator.Count","Mean","Sum")

pdata <- read.csv("Priority_Mapping.csv")
priorityresults<-cbind(pdata[2],priorityresult)
#indicator results
indresults<- rowMeans(coef[2:17])
indresults<- cbind(indresults, rowSums(coef[2:17]))
colnames(indresults)<-c("Mean","Sum")
#missing indicators
which(indresults[,2]==0)


#PCA ON OUTCOMES
#using the coefficient matrix, we want to understand:
#1. what are the similarties among the determinants of priorities?
#2. based on the priorities, can we 'score' indicators?

library("princomp")

pcasummary<-summary(pc.cr<-princomp(coef,cor=TRUE, scores=TRUE))
loadings(pc.cr)

#screeplot capture the variance captured by each factor
pca<-prcomp(coef[2:17], scale=T)
melted<-cbind(pdata[2],melt(pca$rotation[,1:9]))
barplot<-ggplot(data=melted)+geom_bar(aes(x=Priority_Description,y=value,fill=Priority_Description), stat="identity")+facet_wrap(~X2)+theme(axis.text.x=element_blank())

melted<-cbind(pdata[2],melt(pca$rotation[,1:16]))
melted$X2<-factor(melted$X2,levels=unique(melted$X2))
barplot<-ggplot(data=melted)+geom_bar(aes(x=Priority_Description,y=value,fill=Priority_Description), stat="identity")+facet_wrap(~X2)+theme(axis.text.x=element_blank())

pcaimp<-as.data.frame(pcasummary$importance[1,])
colnames(pcaimp)<-'Variation'
Principal_Components<-factor(rownames(pcaimp),levels=unique(rownames(pcaimp)))
screeplot<-ggplot(data=pcaimp)+geom_bar(aes(x=Principal_Components,y=pcaimp$Variation),stat="identity")

pca<-prcomp(coef[2:17],scale=T)
melted<-cbind(variable.group, melt(pca$rotation[,1:9]))

#we used the top 3 factors that account for x% of variance

#each indicator now has 3 distinct scores based on the PCA
#we used this to create HCL 'score' to determine color




