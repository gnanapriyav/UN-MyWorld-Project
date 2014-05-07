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

Impact <- c("Positive","Positive","Positive","Positive","Positive","Negative","Negative","Negative","Negative","Negative")
p100$Impact<- Impact
p101$Impact<- Impact
p102$Impact<- Impact
p103$Impact<- Impact
p104$Impact<- Impact
p105$Impact<- Impact
p106$Impact<- Impact
p107$Impact<- Impact
p108$Impact<- Impact
p109$Impact<- Impact
p110$Impact<- Impact
p111$Impact<- Impact
p112$Impact<- Impact
p113$Impact<- Impact
p114$Impact<- Impact
p115$Impact<- Impact


#Create ggplots for each of the priorities

ggplot(p100,aes(y=priority100,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Action taken on climate change Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))

ggplot(p101,aes(y=priority101,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Better transport and roads Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p102,aes(y=priority102,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Support for people who can't work Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p103,aes(y=priority103,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Access to clean water and sanitation Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p104,aes(y=priority104,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Better healthcare Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p105,aes(y=priority105,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("A good education Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p106,aes(y=priority106,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("A responsive government we can trust Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p107,aes(y=priority107,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Phone and internet access Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p108,aes(y=priority108,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Reliable energy at home Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p109,aes(y=priority109,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Affordable and nutritious food Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p110,aes(y=priority110,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Protecting forests, rivers and oceans Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))
ggplot(p112,aes(y=priority112,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Political freedoms Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))  
ggplot(p111,aes(y=priority111,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Protection against crime and violence Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))                                                                                                           
ggplot(p113,aes(y=priority113,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Freedom from discrimination and persecution Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))                                                                                                           
ggplot(p114,aes(y=priority114,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Equality between men and women Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))                                                                                                           
ggplot(p115,aes(y=priority115,x=Indicator.Description, fill=Impact)) + geom_bar() + coord_flip() + ggtitle("Better job opportunities Vs Beta Coefficient") + ylab("Beta Coefficient") + xlab("World Bank Indicator")  + theme(axis.text=element_text(size=12,face="bold"), axis.title=element_text(size=14,face="bold"))


#Create circular graph
t0<- data.frame(Indicator=as.character(p100[1:5,1]))
t1<- data.frame(Indicator=as.character(p101[1:5,1]))
t2<- data.frame(Indicator=as.character(p102[1:5,1]))
t3<- data.frame(Indicator=as.character(p103[1:5,1]))
t4<- data.frame(Indicator=as.character(p104[1:5,1]))
t5<- data.frame(Indicator=as.character(p105[1:5,1]))
t6<- data.frame(Indicator=as.character(p106[1:5,1]))
t7<- data.frame(Indicator=as.character(p107[1:5,1]))
t8<- data.frame(Indicator=as.character(p108[1:5,1]))
t9<- data.frame(Indicator=as.character(p109[1:5,1]))
t10<- data.frame(Indicator=as.character(p110[1:5,1]))
t11<- data.frame(Indicator=as.character(p111[1:5,1]))
t12<- data.frame(Indicator=as.character(p112[1:5,1]))
t13<- data.frame(Indicator=as.character(p113[1:5,1]))
t14<- data.frame(Indicator=as.character(p114[1:5,1]))
t15<- data.frame(Indicator=as.character(p115[1:5,1]))

#Bind t0 thru t15 into Ind dataframe
Ind <- unique(rbind(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15))
Ind$Indicator.Description <- as.character(Ind$Indicator.Description)
coeff$Indicator.Description <- as.character(coeff$Indicator.Description)
circle_data <- join(coeff,Ind,by="Indicator.Description",type="inner")
#backup circle_data
circle_data_b <- circle_data

#Replace all negative values to zero
circle_data[circle_data<0] <- 0

#sum up the coefficients of priorities for each of the indicators
circle_data$sum <- rowSums(circle_data[,3:18])
#calculate the sum of circle_data$sum
s <- sum(circle_data$sum)
#calcuate the width of each indicator within 75% of the total circumference of the circle
circle_data$widthpercentage <- (circle_data$sum/s) * 75
#sanity check -- sum(circle_data$widthpercentage) = 75

#create columns with width percentage for the edges between each of the indicators and the priorities. 
circle_data$p100widthpercentage <- (circle_data[,3] / circle_data$widthpercentage) * 100
#For example -- circle_data$p100widthpercentage of corresponding (circle_data$widthpercentage * 0.75) = x. where x is the width of the edge between specific indicator and the priority
circle_data$p101widthpercentage <- (circle_data[,4] / circle_data$widthpercentage) * 100
circle_data$p102widthpercentage <- (circle_data[,5] / circle_data$widthpercentage) * 100
circle_data$p103widthpercentage <- (circle_data[,6] / circle_data$widthpercentage) * 100
circle_data$p104widthpercentage <- (circle_data[,7] / circle_data$widthpercentage) * 100
circle_data$p105widthpercentage <- (circle_data[,8] / circle_data$widthpercentage) * 100
circle_data$p106widthpercentage <- (circle_data[,9] / circle_data$widthpercentage) * 100
circle_data$p107widthpercentage <- (circle_data[,10] / circle_data$widthpercentage) * 100
circle_data$p108widthpercentage <- (circle_data[,11] / circle_data$widthpercentage) * 100
circle_data$p109widthpercentage <- (circle_data[,12] / circle_data$widthpercentage) * 100
circle_data$p110widthpercentage <- (circle_data[,13] / circle_data$widthpercentage) * 100
circle_data$p111widthpercentage <- (circle_data[,14] / circle_data$widthpercentage) * 100
circle_data$p112widthpercentage <- (circle_data[,15] / circle_data$widthpercentage) * 100
circle_data$p113widthpercentage <- (circle_data[,16] / circle_data$widthpercentage) * 100
circle_data$p114widthpercentage <- (circle_data[,17] / circle_data$widthpercentage) * 100
circle_data$p115widthpercentage <- (circle_data[,18] / circle_data$widthpercentage) * 100

























