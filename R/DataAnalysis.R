setwd('../unmyworld')
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
for (i in 1:16) {
    list.append(codeMRColumn(MR_input[,i]))
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

#Extract first 100 rows into sdata100 for testing purposes
sdata100 <- head(sdata,n=100)

for (i in 1:100){
  sdata1$country[i] = sdata100$country[i]
  for (j in 8:13) {
    colname=paste('priority',sdata100[i,j],sep='')
    sdata1[i,colname]=1
  }
}

