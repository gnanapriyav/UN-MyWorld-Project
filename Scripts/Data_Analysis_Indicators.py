
import numpy as np
import pandas as pd
import csv


f = open('/Users/erinmcmahon/mygit/UN-MyWorld-Project/Data/Indicators_final.csv','rb')



for row in csv.DictReader(f):
	countryName= str(row["Country Name"])
	countryCode = str(row['Country Code'])
	IndicatorName=str(row['Indicator Name'])
	IndicatorCode=str(row['Indicator Code'])
	Year2005=str(row['2005 [YR2005]'])
	Year2006=str(row['2006 [YR2006]'])
	Year2007=str(row['2007 [YR2007]'])
	Year2008=str(row['2008 [YR2008]'])
	Year2009=str(row['2009 [YR2009]'])
	Year2010=str(row['2010 [YR2010]'])
	Year2011=str(row['2011 [YR2011]'])
	Year2012=str(row['2012 [YR2012]'])
	Year2013=str(row['2013 [YR2013]'])
f.close()


	n=Year2005.size
	imputation=np.zero(shape=(n,1))
	Delta11=np.zero(shape=(n,1))
	Delta12=np.zero(shape=(n,1))
	Delta13=np.zero(shape=(n,1))

	for i in range(n):
		if (Year2012[i] = '#NA' && Year2011[i] = '#NA' && Year2010[i]= '#NA'):
			imputation[i]='1'
		else:
			imputation[i]='0'



	#change metrics
	for i in range(n):
		if (Year2010[i] != '#NA' && Year2011[i] != '#NA'):
			Delta11[i]=(Year2011[i]/Year2010[i])-1
		if (Year2011[i] != '#NA' && Year2012[i] != '#NA'):
			Delta12[i]=(Year2012[i]/Year2011[i])-1
		if (Year2012[i] != '#NA' && Year2013[i] != '#NA'):
			Delta13[i]=(Year2013[i]/Year2012[i])-1

	AvgDelta11=np.mean(Delta11)
	AvgDelta12=np.mean(Delta12)
	AvgDelta13=np.mean(Delta13)

	#imputations
	for i in range(n):
		if (Year2010[i] = '#NA' && Year2011[i] != '#NA'):
			AvgImpute11[i]=Year2011[i]/(1+AvgDelta11)
		elif (Year2010[i] != '#NA' && Year2011[i] = '#NA'):
			AvgImpute11[i]=Year2010[i]*(1+AvgDelta11)
		elif (Year2010[i] != '#NA' && Year2011[i] != '#NA'):
			AvgImpute11[i]=np.mean(Year2010[i],Year2011[i])
		else: 
			AvgImpute[i]='#NA'






