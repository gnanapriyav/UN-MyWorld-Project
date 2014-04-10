indicators <- read.csv("/Users/erinmcmahon/mygit/UN-MyWorld-Project/Data/Indicators_final.csv")

#changing to num
indicators$X2005..YR2005 <- as.numeric(sub("#N/A",".",indicators$X2005..YR2005))
indicators$X2006..YR2006 <- as.numeric(sub("#N/A",".",indicators$X2006..YR2006))
indicators$X2007..YR2007 <- as.numeric(sub("#N/A",".",indicators$X2007..YR2007))
indicators$X2008..YR2008 <- as.numeric(sub("#N/A",".",indicators$X2008..YR2008))
indicators$X2009..YR2009 <- as.numeric(sub("#N/A",".",indicators$X2009..YR2009))
indicators$X2010..YR2010 <- as.numeric(sub("#N/A",".",indicators$X2010..YR2010))
indicators$X2011..YR2011 <- as.numeric(sub("#N/A",".",indicators$X2011..YR2011))
indicators$X2012..YR2012 <- as.numeric(sub("#N/A",".",indicators$X2012..YR2012))
indicators$X2013..YR2013 <- as.numeric(sub("#N/A",".",indicators$X2013..YR2013))

#counting 
indicators$X2010.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2010..YR2010)
indicators$X2011.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2011..YR2011)
indicators$X2012.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2012..YR2012)
indicators$X2013.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2013..YR2013)

#creating charge variable and counting change variable
indicators$delta1210<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2010..YR2010,x2=indicators$X2012..YR2012)
indicators$delta1210.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta1210)
indicators$delta10<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2009..YR2009,x2=indicators$X2010..YR2010)
indicators$delta10.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta10)
delta11<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2010..YR2010,x2=indicators$X2011..YR2011)
delta11.count<- mapply(function(x) {return (is.finite(x))}, x=delta11)
delta12<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2011..YR2011,x2=indicators$X2012..YR2012)
delta12.count<- mapply(function(x) {return (is.finite(x))}, x=delta12)
delta13<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2012..YR2012,x2=indicators$X2013..YR2013)
delta13.count<- mapply(function(x) {return (is.finite(x))}, x=delta13)
indicators <- cbind(indicators,data.frame(delta11,delta11.count,delta12,delta12.count,delta13,delta13.count))

#total counts (unnecessary)
indicators$count<-mapply(function(x,y,z) {if (isTRUE(x) || isTRUE(y) || isTRUE(z)) {return (TRUE)} else {return (FALSE)}} ,x=indicators$X2011.count,y=indicators$X2012.count,z=indicators$X2013.count)
indicators$deltacount<-mapply(function(x,y,z) {if (isTRUE(x) || isTRUE(y) || isTRUE(z)) {return (TRUE)} else {return (FALSE)}} ,x=delta11.count,y=delta12.count,z=delta13.count)

#new dataframe of sum of counts for each indicator
ind <- aggregate(indicators[,c("delta10.count","delta1210.count","delta11.count","delta12.count","delta13.count","X2010.count","X2011.count","X2012.count","X2013.count")],list(indicators$Indicator.Name),sum)

#whether we have enough data for indicator
ind$missing.2010 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$X2010.count)
ind$missing.2011 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$X2011.count)
ind$missing.2012 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$X2012.count)
ind$missing.2013 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$X2013.count)

#whether we have enough data for imputation
ind$missingdelta.10 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$delta10.count)
ind$missingdelta.1210 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$delta1210.count)
ind$missingdelta.11 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$delta11.count)
ind$missingdelta.12 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$delta12.count)
ind$missingdelta.13 <- mapply(function(x) { if (x>=100) {return (1)} else {return (0)}}, x=ind$delta13.count)

delta1210NA <- indicators$delta1210
delta12NA <- indicators$delta12
d=data.frame(cbind(indicators[c("Country.Name","Indicator.Name")],delta1210NA,delta12NA))
d[is.na(d)] <-0
meansum <- aggregate(d[,c("delta1210NA","delta12NA")],list(indicators$Indicator.Name),mean)

ind<-cbind(ind,meansum)




