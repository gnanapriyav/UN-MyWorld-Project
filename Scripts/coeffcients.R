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
p100 <- rbind(p100desc[1:10,],p100asc[1:10,])
p101 <- rbind(arrange(coeff,desc(priority101))[1:10,],arrange(coeff,priority101)[1:10,])
p102 <- rbind(arrange(coeff,desc(priority102))[1:10,],arrange(coeff,priority102)[1:10,])
p103 <- rbind(arrange(coeff,desc(priority103))[1:10,],arrange(coeff,priority103)[1:10,])
p104 <- rbind(arrange(coeff,desc(priority104))[1:10,],arrange(coeff,priority104)[1:10,])
p105 <- rbind(arrange(coeff,desc(priority105))[1:10,],arrange(coeff,priority105)[1:10,])
p106 <- rbind(arrange(coeff,desc(priority106))[1:10,],arrange(coeff,priority106)[1:10,])
p107 <- rbind(arrange(coeff,desc(priority107))[1:10,],arrange(coeff,priority107)[1:10,])
p108 <- rbind(arrange(coeff,desc(priority108))[1:10,],arrange(coeff,priority108)[1:10,])
p109 <- rbind(arrange(coeff,desc(priority109))[1:10,],arrange(coeff,priority109)[1:10,])
p110 <- rbind(arrange(coeff,desc(priority110))[1:10,],arrange(coeff,priority110)[1:10,])
p111 <- rbind(arrange(coeff,desc(priority111))[1:10,],arrange(coeff,priority111)[1:10,])
p112 <- rbind(arrange(coeff,desc(priority112))[1:10,],arrange(coeff,priority112)[1:10,])
p113 <- rbind(arrange(coeff,desc(priority113))[1:10,],arrange(coeff,priority113)[1:10,])
p114 <- rbind(arrange(coeff,desc(priority114))[1:10,],arrange(coeff,priority114)[1:10,])
p115 <- rbind(arrange(coeff,desc(priority115))[1:10,],arrange(coeff,priority115)[1:10,])



