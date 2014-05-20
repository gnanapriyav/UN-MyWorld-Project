setwd('../unmyworld')

#for Erin:
setwd('/Users/erinmcmahon/mygit/UN-MYWorld-Project/Data/')

sdata <- read.csv("MYWorld_votes_all.csv")
cdata <- read.csv("Country_Mapping.csv")
pdata <- read.csv("Priority_Mapping.csv")

#Create emtpty dataframe with columns country, priority 1 through priority 15
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
<<<<<<< HEAD
for (i in 1:16) {
    list.append(codeMRColumn(MR_input[,i]))
=======
#for (i in 1:16) {
#    dicot_columns.append(codeMRColumn(MR_input[,i]))
    #try append(list,codeMRColumn(MR_input[,i]))
#}

for (i in 1:16) {
    dicot_columns[[length(dicot_columns)+1]] <- codeMRColumn(MR_input[,i])
>>>>>>> 4a8ddf6... Final data files added
}

system.time(MR_list <- lapply(MR_input, codeMRColumn))
multipleResponseDichotomies <- MR_list[[1]]
system.time(
for (i in 2:length(MR_list)){
    multipleResponseDichotomies <- multipleResponseDichotomies | MR_list[[i]]
})
multipleResponseDichotomies <- multipleResponseDichotomies[,1:16]
## How many people selected each priority?
colSums(multipleResponseDichotomies)

sdata <- cbind(sdata, multipleResponseDichotomies)

library(plyr)
# dlply(sdata, .(country), function( ...

sdata1 <- data.frame(country=numeric(no_of_rows),priority100=numeric(no_of_rows),priority101=numeric(no_of_rows),priority102=numeric(no_of_rows),priority103=numeric
                     (no_of_rows),priority104=numeric(no_of_rows),priority105=numeric(no_of_rows),priority106=numeric(no_of_rows),priority107=numeric(no_of_rows),priority108=numeric(no_of_rows),  priority109=numeric
                     (no_of_rows),priority110=numeric(no_of_rows),priority111=numeric(no_of_rows),priority112=numeric(no_of_rows),priority113=numeric(no_of_rows),priority114=numeric(no_of_rows),priority115=numeric(no_of_rows))


#AGGREGATING

sdata$count<-1


priorities<-aggregate(sdata[,c(17:33)],by=list(sdata$country),FUN=sum)



priorities<-priorities[1:194,]
names(priorities)[names(priorities)=='Group.1']<-'Country_Code'

#got rid of Naauru
priorities<-merge(cdata,priorities,by=c("Country_Code"))

prioritiesperc<-mapply(x=priorities[3:18], function(x) {return (x/priorities$count)})

priorityfinal<-cbind(priorities[,c(1:2)],prioritiesperc)

#lining up with indicators
priorityfinal$Country.Code<-countrycode(priorityfinal$Country_Name, "country.name","wb")
priorityfinal<-priorityfinal[order(priorityfinal$Country.Code),]

priorityfinal$Country.Code[193]<-'USA' 
priorityfinal$Country.Code[192]<-'SVK'
priorityfinal$Country.Code[191]<-'WSM' 
priorityfinal<-priorityfinal[order(priorityfinal$Country.Code),]

priorityfinal$Country.Code<-as.factor(priorityfinal$Country.Code)

#truncating to 172 countries
priorityfinal<-merge(priorityfinal,X[c("Country.Code")],by=c("Country.Code"))




#Extract first 100 rows into sdata100 for testing purposes
sdata100 <- head(sdata,n=100)

for (i in 1:100){
  sdata1$country[i] = sdata100$country[i]
  for (j in 8:13) {
    colname=paste('priority',sdata100[i,j],sep='')
    sdata1[i,colname]=1
  }
}

