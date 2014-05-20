###########################################################
#DATA MANIPULATION
###########################################################
#importing
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

#removing factors
indicators['X2005..YR2005.']<-NULL
indicators['X2006..YR2006.']<-NULL
indicators['X2007..YR2007.']<-NULL
indicators['X2008..YR2008.']<-NULL
indicators['X2009..YR2009.']<-NULL
indicators['X2010..YR2010.']<-NULL
indicators['X2011..YR2011.']<-NULL
indicators['X2012..YR2012.']<-NULL
indicators['X2013..YR2013.']<-NULL

#counting 
indicators$X2010.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2010..YR2010)
indicators$X2011.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2011..YR2011)
indicators$X2012.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2012..YR2012)
indicators$X2013.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2013..YR2013)

#creating change variable and counting change variable
indicators$delta1210<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2010..YR2010,x2=indicators$X2012..YR2012)
indicators$delta1210.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta1210)
indicators$delta10<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2009..YR2009,x2=indicators$X2010..YR2010)
indicators$delta10.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta10)
indicators$delta11<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2010..YR2010,x2=indicators$X2011..YR2011)
indicators$delta11.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta11)
indicators$delta12<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2011..YR2011,x2=indicators$X2012..YR2012)
indicators$delta12.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta12)
indicators$delta13<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2012..YR2012,x2=indicators$X2013..YR2013)
indicators$delta13.count<- mapply(function(x) {return (is.finite(x))}, x=indicators$delta13)

#need these change variables for specific imputations
indicators$delta1008<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2008..YR2008,x2=indicators$X2010..YR2010)
indicators$delta1009<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2009..YR2009,x2=indicators$X2010..YR2010)
indicators$delta1109<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2009..YR2009,x2=indicators$X2011..YR2011)
indicators$delta1110<-mapply(function(x1,x2) {return (x2/x1-1)}, x1=indicators$X2010..YR2010,x2=indicators$X2011..YR2011)

#total counts (unnecessary)
#indicators$count<-mapply(function(x,y,z) {if (isTRUE(x) || isTRUE(y) || isTRUE(z)) {return (TRUE)} else {return (FALSE)}} ,x=indicators$X2011.count,y=indicators$X2012.count,z=indicators$X2013.count)
#indicators$deltacount<-mapply(function(x,y,z) {if (isTRUE(x) || isTRUE(y) || isTRUE(z)) {return (TRUE)} else {return (FALSE)}} ,x=delta11.count,y=delta12.count,z=delta13.count)


#Adding in Ease of Doing Business Metrics
EODB <- read.csv("/Users/erinmcmahon/mygit/UN-MyWorld-Project/Data/EaseDoingBusiness.csv")

EODB$Dealing.with.Construction.Permits.Procedures<- as.integer(sub("#N/A",".",EODB$Dealing.with.Construction.Permits.Procedures))
EODB$Dealing.with.Construction.Permits.Time<- as.integer(sub("#N/A",".",EODB$Dealing.with.Construction.Permits.Time))
EODB$Dealing.with.Construction.Permits.Cost<- as.integer(sub("#N/A",".",EODB$Dealing.with.Construction.Permits.Cost))
EODB$Registering.Property.Procedures<- as.integer(sub("#N/A",".",EODB$Registering.Property.Procedures))
EODB$Registering.Property.Time<- as.integer(sub("#N/A",".",EODB$Registering.Property.Time))
EODB$Registering.Property.Cost<- as.integer(sub("#N/A",".",EODB$Registering.Property.Cost))
EODB$Resolving.Insolvency.Time<- as.integer(sub("#N/A",".",EODB$Resolving.Insolvency.Time))
EODB$Resolving.Insolvency.Cost<- as.integer(sub("#N/A",".",EODB$Resolving.Insolvency.Cost))
EODB$Resolving.Insolvency.Outcome<- as.integer(sub("#N/A",".",EODB$Resolving.Insolvency.Outcome))

EODB$Country.Code<-countrycode(EODB$Economy, "country.name","wb")
EODB<-EODB[order(EODB$Country.Code),]

EODB$Country.Code<-as.factor(EODB$Country.Code)



###########################################################
#AGGREGATE MEASURES
###########################################################

#new dataframe of sum of counts for each indicator
ind <- aggregate(indicators[,c("delta10.count","delta1210.count","delta11.count","delta12.count","delta13.count","X2010.count","X2011.count","X2012.count","X2013.count")],list(indicators$Indicator.Name),sum)

#whether we have enough data for indicator
ind$missing.2010 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$X2010.count)
ind$missing.2011 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$X2011.count)
ind$missing.2012 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$X2012.count)
ind$missing.2013 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$X2013.count)

#whether we have enough data for imputation
ind$missingdelta.10 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$delta10.count)
ind$missingdelta.1210 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$delta1210.count)
ind$missingdelta.11 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$delta11.count)
ind$missingdelta.12 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$delta12.count)
ind$missingdelta.13 <- mapply(function(x) { if (x>=95) {return (1)} else {return (0)}}, x=ind$delta13.count)
names(ind)[names(ind)=='Group.1']<-'Indicator.Name'

#average delta for variable
meansum<- aggregate(indicators[,c("delta1210","delta11","delta12","delta1110","delta1109","delta1009","delta1008")],by=list(indicators$Indicator.Name),FUN=mean, na.rm=TRUE)
meansum$delta1210 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta1210)
meansum$delta11 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta11)
meansum$delta12 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta12)
meansum$delta1008 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta1008)
meansum$delta1009 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta1009)
meansum$delta1109 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta1109)
meansum$delta1110 <- mapply(function(x) {if (isTRUE(is.finite(x))) {return (x)} else {return (NA)}}, x=meansum$delta1110)
names(meansum)[names(meansum)=='Group.1']<-'Indicator.Name'

#binding average deltas to counts dataframe
ind<-merge(ind,meansum,by=c("Indicator.Name"))


#if the count is greater than 95, set delta
#ind$delta1210final<-mapply(function(x,y) { if (y==0) {return (NA)} else { return (x)}}, x=ind$delta1210,y=ind$missing.2010)
#ind$delta11final<-mapply(function(x,y) { if (y==0) {return (NA)} else { return (x)}}, x=ind$delta11,y=ind$missing.2010)
#ind$delta12final<-mapply(function(x,y) { if (y==0) {return (NA)} else { return (x)}}, x=ind$delta12,y=ind$missing.2011)

#merge average deltas back into dataframe
indicators<- merge(indicators[-c(14:31)],ind[c("Indicator.Name","X2010.count","X2011.count","X2012.count","X2013.count","delta1008","delta1009","delta1109","delta1110","delta1210","delta11","delta12")],by=c("Indicator.Name"))



###########################################################
#IMPUTATIONS
###########################################################

#creating index of imputed values
indexMissing<-which(is.na(indicators$X2012..YR2012))
indicators$X2012Impute<-indicators$X2012..YR2012
#Zero imputes: 31,847 Missing
indicators$indexMissing<-0
indicators$indexMissing[indexMissing]<-1
#sums to 31.847 Missing

#first imputing from 2011 and if missing, then 2010
indicators$X2012Impute[indexMissing]<- indicators$X2011..YR2011[indexMissing]*indicators$delta12[indexMissing]
indexMissing10<-which(is.na(indicators$X2012Impute))
indicators$X2012Impute[indexMissing10]<- indicators$X2010..YR2010[indexMissing10]*indicators$delta1210[indexMissing10]
#First set of impute: 27,984 Missing

###########################################################
#IMPUTATIONS FOR SPECIFIC CASES
###########################################################

#pulled from excel 
unq <- read.csv("/Users/erinmcmahon/mygit/UN-MyWorld-Project/Data/Impute_Green.csv")
unq$Year<-as.character(unq$Year)
names(unq)[names(unq)=='Year']<-'YearImpute'
unqYear<-unique(unq$YearImpute)

#merging Year for Imputation into dataset
indicators<-merge(indicators,unq[c("Indicator.Name","Comment","YearImpute")],by=c("Indicator.Name"),all=TRUE)

#using the year specified to impute
indicators$X2012Impute[which((indicators$YearImpute)=='X2011..YR2011')]<-indicators$X2011..YR2011[which((indicators$YearImpute)=='X2011..YR2011')]
indicators$X2012Impute[which((indicators$YearImpute)=='X2010..YR2010')]<-indicators$X2010..YR2010[which((indicators$YearImpute)=='X2010..YR2010')]
indicators$X2012Impute[which((indicators$YearImpute)=='X2009..YR2009')]<-indicators$X2009..YR2009[which((indicators$YearImpute)=='X2009..YR2009')]
indicators$X2012Impute[which((indicators$YearImpute)=='X2008..YR2008')]<-indicators$X2008..YR2008[which((indicators$YearImpute)=='X2008..YR2008')]
indicators$X2012Impute[which((indicators$YearImpute)=='X2005..YR2005')]<-indicators$X2005..YR2005[which((indicators$YearImpute)=='X2005..YR2005')]
indicators$X2012Impute[which((indicators$YearImpute)=='X2013..YR2013')]<-indicators$X2013..YR2013[which((indicators$YearImpute)=='X2013..YR2013')]
#Second set of impute: 21,194 Missing

#create index and impute values using growth rate
indexMissing10Impute<-which(((indicators$YearImpute)=='X2010..YR2010')&(is.na(indicators$X2012Impute)==TRUE))
indicators$X2012Impute[indexMissing10Impute]<-indicators$X2009..YR2009[indexMissing10Impute]*indicators$delta1009[indexMissing10Impute]
#Third set(1) of imputes: 21,114 Missing

#re-run for 2008: 2009's will now be filtered out
indexMissing10Impute<-which(((indicators$YearImpute)=='X2010..YR2010')&(is.na(indicators$X2012Impute)==TRUE))
indicators$X2012Impute[indexMissing10Impute]<-indicators$X2008..YR2008[indexMissing10Impute]*indicators$delta1008[indexMissing10Impute]
#Third set(2) of impute: 21,052 Missing


indexMissing11Impute<-which(((indicators$YearImpute)=='X2011..YR2011')&(is.na(indicators$X2012Impute)==TRUE))
indicators$X2012Impute[indexMissing11Impute]<-indicators$X2010..YR2010[indexMissing11Impute]*indicators$delta1110[indexMissing11Impute]
#Third set(3) of impute: 20,446 Missing

#re-run for 2009: 2010's will now be filtered out
indexMissing11Impute<-which(((indicators$YearImpute)=='X2011..YR2011')&(is.na(indicators$X2012Impute)==TRUE))
indicators$X2012Impute[indexMissing11Impute]<-indicators$X2009..YR2009[indexMissing11Impute]*indicators$delta1109[indexMissing11Impute]
#Third set of imputes: 20,295 Missing 




###########################################################
#REMOVING VARIABLES
###########################################################
#Removing indicators
#pulling from excel
del <- read.csv("/Users/erinmcmahon/mygit/UN-MyWorld-Project/Data/Impute_Red.csv")
del$Indicator.Name<-as.character(del$Indicator.Name)

indicators<-merge(indicators,del[c("Indicator.Name","Comment")],by=c("Indicator.Name"),all=TRUE)

indicators<-indicators[which(is.na(indicators$Comment.y)),]
#Missing= 11,445
#Reduced number of observations (countries*indicators) to 35,096

indicators$Comment.y<-NULL

#Removing countries
library("countrycode")

indicators<-indicators[order(indicators$Country.Code),]

cntry <- read.csv("/Users/erinmcmahon/mygit/UN-MyWorld-Project/Data/Country_myworld.csv")
cntry$Country.Code<-countrycode(cntry$Country_Name, "country.name","wb")
cntry<-cntry[order(cntry$Country.Code),]

#for some reason, these wouldn't merge...
cntry$Country.Code[193]<-'USA' 
cntry$Country.Code[192]<-'SVK'
cntry$Country.Code[191]<-'WSM' 
cntry<-cntry[order(cntry$Country.Code),]

cntry$Country.Code<-as.factor(cntry$Country.Code)
cntry$MyWorld<-1

#merging ...
indicators<-merge(indicators,cntry,by=c("Country.Code"))

#Two labels differ:
#UK and Ireland >> combined in WB MyWorld
#North Korea and South Korea >> North Korea is missing in WB MyWorld
#Keeping UN labels (i.e. Country.Name)

indicators<-indicators[order(indicators$Indicator.Name),]
#total samples = 31,652
#Missing= 8,698

#removing other countries based on low UN data
#re-counting missing 
indicators$X2012Impute.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2012Impute)
cntryind <- aggregate(indicators[,c("X2012Impute.count")],list(indicators$Country.Code),sum)
cntryind$missing <- mapply(function(x) { if (x>=90) {return (1)} else {return (NA)}}, x=cntryind$x)
names(cntryind)[names(cntryind)=='Group.1']<-'Country.Code'

#will remove 21 countries.. mostly islands and such
indicators<-merge(indicators,cntryind[c("Country.Code","missing")],by=c("Country.Code"))
indicators<-indicators[which(is.na(indicators$missing)==FALSE),]
# Observations = 28,208 / Missing = 6,529

indicators$missing<-NULL
indicators$MyWorld<-NULL

#final percentage of sample still missing
1-sum(indicators$X2012Impute.count,na.rm=TRUE)/length(indicators$X2012Impute.count) #0.2314592

#final counts of missing and one last look at indicators
indicators$X2012Impute.count <-mapply(function(x) {return(is.finite(x))},x=indicators$X2012Impute)
X2012Impute.count <- aggregate(indicators[,c("X2012Impute.count")],list(indicators$Indicator.Name),sum)

finalind<-indicators[c("Country.Code","Indicator.Code","X2012Impute")]
#28,208 observations
#6,240 Missing
#172 Countries
#164 Indicators




###########################################################
#RESHAPING DATA INTO MATRIX
###########################################################
#reshaping so indicators are now variables
library("reshape")
X<-cast(finalind,Country.Code~Indicator.Code,mean)

#now we add EODB indicators into our previous dataset
X<-X[order(X$Country.Code),]
EODB<-EODB[order(EODB$Country.Code),]

X<-merge(X,EODB,by=c("Country.Code"))
#had to add Cuba to EODB
#when we merge, EODB indicators 22 lose countries: 194 to 172

#reorganizing data
reorderhead<-X[c("Country.Code","Economy","Income")]
reorder<-X[-c(1,166:168)]

X<-data.frame(reorderhead,reorder)


#subsetting data for remaining imputations from median of income group
XLowIncome<-subset(X, Income==1)
XLowMidIncome<-subset(X, Income==2)
XMidHighIncome<-subset(X,Income==3)
XHighIncome<-subset(X,Income==4)

#running thru columns to find median
library("miscTools")

for (i in 4:218) {
	XLowIncome[i][is.na(XLowIncome[i])]<-colMedians(XLowIncome[i],na.rm=TRUE)
	XLowMidIncome[i][is.na(XLowMidIncome[i])]<-colMedians(XLowMidIncome[i],na.rm=TRUE)
	XMidHighIncome[i][is.na(XMidHighIncome[i])]<-colMedians(XMidHighIncome[i],na.rm=TRUE)
	XHighIncome[i][is.na(XHighIncome[i])]<-colMedians(XHighIncome[i],na.rm=TRUE)
}

#binding back the results
#this gets tricky because sort function likes to sort only among the rbind groups
#so, we have to use attach/detach in order to get back to previous sorting

library("gtools")
X<-smartbind(XLowIncome,XLowMidIncome,XMidHighIncome,XHighIncome)
attach(X)
Xsort<-X[order(Country.Code),]
detach(Xsort)
edit(Xsort)


###########################################################
#READY FOR ELASTIC NET
###########################################################

#final outcome:
#172 Countries
#218 Indicators

