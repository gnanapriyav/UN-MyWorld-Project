#set working directory
setwd("Git Projects/unmyworld")

#load librarys
library(data.table)
library(plyr)

#read coeff matrix file into R
coeff <- read.csv("Data/coefmatrix.csv")
#sort priority 100
p100desc <- arrange(coeff,desc(priority100))
p100asc <- arrange(coeff,priority100)
#capture top10 and bottom 10 indicators for each of the priority
p100 <- rbind(p100desc[1:5,c(2,3)],p100asc[1:5,c(2,3)])
p101 <- rbind(arrange(coeff,desc(priority101))[1:5,c(2,4)],arrange(coeff,priority101)[1:5,c(2,4)])
p102 <- rbind(arrange(coeff,desc(priority102))[1:5,c(2,5)],arrange(coeff,priority102)[1:5,c(2,5)])
p103 <- rbind(arrange(coeff,desc(priority103))[1:5,c(2,6)],arrange(coeff,priority103)[1:5,c(2,6)])
p104 <- rbind(arrange(coeff,desc(priority104))[1:5,c(2,7)],arrange(coeff,priority104)[1:5,c(2,7)])
p105 <- rbind(arrange(coeff,desc(priority105))[1:5,c(2,8)],arrange(coeff,priority105)[1:5,c(2,8)])
p106 <- rbind(arrange(coeff,desc(priority106))[1:5,c(2,9)],arrange(coeff,priority106)[1:5,c(2,9)])
p107 <- rbind(arrange(coeff,desc(priority107))[1:5,c(2,10)],arrange(coeff,priority107)[1:5,c(2,10)])
p108 <- rbind(arrange(coeff,desc(priority108))[1:5,c(2,11)],arrange(coeff,priority108)[1:5,c(2,11)])
p109 <- rbind(arrange(coeff,desc(priority109))[1:5,c(2,12)],arrange(coeff,priority109)[1:5,c(2,12)])
p110 <- rbind(arrange(coeff,desc(priority110))[1:5,c(2,13)],arrange(coeff,priority110)[1:5,c(2,13)])
p111 <- rbind(arrange(coeff,desc(priority111))[1:5,c(2,14)],arrange(coeff,priority111)[1:5,c(2,14)])
p112 <- rbind(arrange(coeff,desc(priority112))[1:5,c(2,15)],arrange(coeff,priority112)[1:5,c(2,15)])
p113 <- rbind(arrange(coeff,desc(priority113))[1:5,c(2,16)],arrange(coeff,priority113)[1:5,c(2,16)])
p114 <- rbind(arrange(coeff,desc(priority114))[1:5,c(2,17)],arrange(coeff,priority114)[1:5,c(2,17)])
p115 <- rbind(arrange(coeff,desc(priority115))[1:5,c(2,18)],arrange(coeff,priority115)[1:5,c(2,18)])

df <- data.frame(prioritycode=100,p100)
df <- rbind(df,data.frame(prioritycode=102,Indicator=p102$Indicator.Description,coeff=p102$priority102))
df <- rbind(df,data.frame(prioritycode=103,Indicator=p103$Indicator.Description,coeff=p103$priority103))
df <- rbind(df,data.frame(prioritycode=104,Indicator=p104$Indicator.Description,coeff=p104$priority104))
df <- rbind(df,data.frame(prioritycode=105,Indicator=p105$Indicator.Description,coeff=p105$priority105))
df <- rbind(df,data.frame(prioritycode=106,Indicator=p106$Indicator.Description,coeff=p106$priority106))
df <- rbind(df,data.frame(prioritycode=107,Indicator=p107$Indicator.Description,coeff=p107$priority107))
df <- rbind(df,data.frame(prioritycode=108,Indicator=p108$Indicator.Description,coeff=p108$priority108))
df <- rbind(df,data.frame(prioritycode=109,Indicator=p109$Indicator.Description,coeff=p109$priority109))
df <- rbind(df,data.frame(prioritycode=110,Indicator=p110$Indicator.Description,coeff=p110$priority110))
df <- rbind(df,data.frame(prioritycode=111,Indicator=p111$Indicator.Description,coeff=p111$priority111))
df <- rbind(df,data.frame(prioritycode=112,Indicator=p112$Indicator.Description,coeff=p112$priority112))
df <- rbind(df,data.frame(prioritycode=113,Indicator=p113$Indicator.Description,coeff=p113$priority113))
df <- rbind(df,data.frame(prioritycode=114,Indicator=p114$Indicator.Description,coeff=p114$priority114))
df <- rbind(df,data.frame(prioritycode=115,Indicator=p115$Indicator.Description,coeff=p115$priority115))

