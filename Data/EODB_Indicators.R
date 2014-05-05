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
<<<<<<< HEAD
EODB$EODB<-1
=======


#28,208 observations in indicators

X<-X[order(X$Country.Code),]
EODB<-EODB[order(EODB$Country.Code),]

X<-merge(X,EODB,by=c("Country.Code"))

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
library("gtools")
X<-smartbind(XLowIncome,XLowMidIncome,XMidHighIncome,XHighIncome)
attach(X)
Xsort<-X[order(Country.Code),]
detach(Xsort)
edit(Xsort)



#final outcome:
#172 Countries
#218 Indicators



>>>>>>> 4a8ddf6... Final data files added



#31,325 observations in indicators
