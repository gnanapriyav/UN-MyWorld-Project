sdata <- read.csv("Data/MYWorld_votes_all.csv")
cdata <- read.csv("Data/Country_Mapping.csv")
pdata <- read.csv("Data/Priority_Mapping.csv")

#Create emtpty dataframe with columns country, priority 1 through priority 15
no_of_rows = length(sdata$country)

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

