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
EODB$EODB<-1



#31,325 observations in indicators
