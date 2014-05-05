#Load the indicators file into data.table
indicators <- data.table(read.csv("Data/indicators.csv"))

#set Country code and Indicators Name as keys
setkey(indicators,Indicator.Name,Country.Code)


#Extract indicators with color coding = green, action = use 2011 data
green_2011 <- c("Average precipitation in depth (mm per year)","Crop production index (2004-2006 = 100)","Electric power consumption (kWh per capita)","Food production index (2004-2006 = 100)","Health expenditure per capita PPP (constant 2005 international $)","Health expenditure private (% of GDP)","Health expenditure total (% of GDP)","ICT goods imports (% total goods imports)","Improved sanitation facilities (% of population with access)","Improved water source (% of population with access)","International tourism receipts (% of total exports)","Life expectancy at birth total (years)","Literacy rate adult total (% of people ages 15 and above)","Literacy rate youth female (% of females ages 15-24)","Literacy rate youth total (% of people ages 15-24)","Livestock production index (2004-2006 = 100)","Net barter terms of trade index (2000 = 100)","Out-of-pocket health expenditure (% of private expenditure on health)","Out-of-pocket health expenditure (% of total expenditure on health)","Permanent cropland (% of land area)","Population density (people per sq. km of land area)","Renewable internal freshwater resources per capita (cubic meters)","Water productivity total (constant 2005 US$ GDP per cubic meter of total freshwater withdrawal)")

indicators_green_2011 <- indicators[J(green_2011)]

#copy indicators for backup
backup_indicators <- indicators

#Extract unique Indicator names
unique_indicators <- as.data.table(unique(indicators$Indicator.Name))
unique_indicators <- rename(unique_indicators,replace=c("V1" = "Indicator.Name"))

unique_indicators$YearCol = 11
unique_indicators$YearCol[2] = 12
unique_indicators$YearCol[3] = 13


#indicators$YearCol <- join(indicators,unique_indicators,by=c("Indicator"))
indicators$YearCol <- indicators[,unique_indicators$YearCol,by=indicators$Indicator.Name]



