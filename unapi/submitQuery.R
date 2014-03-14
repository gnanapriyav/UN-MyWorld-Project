library(httr)
preparedQuery <- paste(readLines("UIS+DF_UNData_UIS+1.1_2014_03_14_15_41_17.query.xml"), collapse="")
out <- POST("http://data.un.org/ws/NSIStdV20Service.asmx?op=GetCompactData", body=preparedQuery)

## might have to do this on command line
## note the -H headers for SOAP stuff
## and the > redirect to file
curl -X POST -d @UIS+DF_UNData_UIS+1.1_2014_03_14_15_41_17.query.xml http://data.un.org/ws/NSIStdV20Service.asmx?op=GetCompactData -H "Content-Type: application/soap+xml" -H 'SOAPAction: ""'  "http://ec.europa.eu/eurostat/sri/service/2.0/GetCompactData" > datasets.xml
