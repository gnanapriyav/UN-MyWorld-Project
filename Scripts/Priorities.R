
###########################################################
#DATA MANIPULATION
###########################################################

#importing data and country/priority mapping

sdata <- read.csv("MYWorld_votes_all.csv")
cdata <- read.csv("Country_myworld.csv")
pdata <- read.csv("Priority_Mapping.csv")

no_of_rows = length(sdata$country)

## Transform each of the 6 'numeric response entries'
## to 16 dichotomous-coded 'multiple response items'

## hack off all the other columns to just the responses we're transforming
MR_input <- sdata[,grep('^priority', names(sdata))]

## see if each col has all the levels selected
lapply(MR_input, function(col) {
    sort(unique(col))
})
lapply(MR_input, function(col) {
    sum(is.na(col))
})
## note: looks like if anyone selected 100 as their first, the columns
## get ordered so when '100' is first priority, it is always present
## in the first column

## Transform one numeric-coded vector into a matrix of
## 16 dichotomies
codeMRColumn <- function(col, levels=c(100:115,0)) {
    col[is.na(col)] <- 0
    data_ <- data.frame(col=factor(col, levels=levels))
    out <- model.matrix(~0+ col, data=data_)
    out
}

dicot_columns <- list()
for (i in 1:16) {
    dicot_columns[[length(dicot_columns)+1]] <- codeMRColumn(MR_input[,i])
}

#creating new dataset with binary responses for 16 priorities
system.time(MR_list <- lapply(MR_input, codeMRColumn))
multipleResponseDichotomies <- MR_list[[1]]
system.time(
for (i in 2:length(MR_list)){
    multipleResponseDichotomies <- multipleResponseDichotomies | MR_list[[i]]
})
multipleResponseDichotomies <- multipleResponseDichotomies[,1:16]
## How many people selected each priority?

#how many people selected each priority
colSums(multipleResponseDichotomies)

#bind the new dichotomies back onto our data
sdata <- cbind(sdata, multipleResponseDichotomies)

###########################################################
#AGGREGATING BY COUNTRY
###########################################################

#number of responses
sdata$count<-1

#aggregate by country
priorities<-aggregate(sdata[,c(17:33)],by=list(sdata$country),FUN=sum)

priorities<-priorities[1:194,]
names(priorities)[names(priorities)=='Group.1']<-'Country_Code'

#Add in country names
#Note:got rid of Naauru
priorities<-merge(cdata,priorities,by=c("Country_Code"))

#transform to percentages
prioritiesperc<-mapply(x=priorities[3:18], function(x) {return (x/priorities$count)})

#reorder and add labels
priorityfinal<-cbind(priorities[,c(1:2)],prioritiesperc)

#adding in country codes and sorting
priorityfinal$Country.Code<-countrycode(priorityfinal$Country_Name, "country.name","wb")
priorityfinal<-priorityfinal[order(priorityfinal$Country.Code),]

#again, issues with countrycode package
priorityfinal$Country.Code[193]<-'USA' 
priorityfinal$Country.Code[192]<-'SVK'
priorityfinal$Country.Code[191]<-'WSM' 
priorityfinal<-priorityfinal[order(priorityfinal$Country.Code),]

priorityfinal$Country.Code<-as.factor(priorityfinal$Country.Code)

#truncating to 172 countries
priorityfinal<-merge(priorityfinal,X[c("Country.Code")],by=c("Country.Code"))


###########################################################
#READY FOR ELASTIC NET
###########################################################

#final outcome:
#172 countries
#16 priorities
