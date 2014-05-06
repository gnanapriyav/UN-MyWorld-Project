data <- read.delim(
  "http://pmsi-alignalytics.github.io/dimple/data/example_data.tsv"
)
### eliminate . to avoid confusion in javascript
colnames(data) <- gsub("[.]","",colnames(data))

require(rCharts)
d1 <- dPlot(
  SalesValue~Price,
  groups = c("SKU", "Channel", "Owner"),
  data = subset(data, Date == "01/12/2012"),
  type = "bubble",
  height = 400,
  width = 590,
  bounds = list(x=60, y=30, width=420, height=330)
)
d1$xAxis( type = "addMeasureAxis" )
d1$yAxis( type = "addMeasureAxis" )
d1$legend(
  x = 530,
  y = 100,
  width = 60,
  height = 300,
  horizontalAlign = "right"
)
d1

d2 <- dPlot(
  Price~Channel,
  groups = c("SKU"),
  data = subset(data, Date == "01/12/2012"),
  type = "bubble",
  height = 400,
  width = 590
#  bounds = list(x=60, y=30, width=420, height=330)
)
d2$xAxis( type = "addMeasureAxis" )
d2$yAxis( type = "addMeasureAxis" )
d2$legend(
  x = 600,
  y = 50,
  width = 60,
  height = 300,
  horizontalAlign = "right"
)

d3 <- dPlot(
  Indicator~coeff,
  data = p1,
  type = "bubble",
  height = 400,
  width = 590
  )
d3$xAxis(type="addMeasureAxis")
d3$yAxis(type="addMeasureAxis")
d3

> p1
   prioritycode
1           100
2           100
3           100
4           100
5           100
6           100
7           100
8           100
9           100
10          100
                                                                  Indicator
1        Health expenditure per capita, PPP (constant 2005 international $)
2                                              GDP per capita (current US$)
3                     Fixed broadband Internet subscribers (per 100 people)
4  Labor force participation rate, total (% of total population ages 15-24)
5                                   Life expectancy at birth, total (years)
6                                    Health expenditure, private (% of GDP)
7                                Trading.Across.Borders.Documents.to.import
8                              Net barter terms of trade index (2000 = 100)
9                                        Inflation, GDP deflator (annual %)
10                                              Trading.Across.Borders.Rank
         coeff
1   0.11810250
2   0.11416851
3   0.09570410
4   0.07371180
5   0.07310356
6  -0.10472229
7  -0.06974623
8  -0.06729926
9  -0.05427352
10 -0.04396689

d4 <- dPlot(
  coeff~Indicator,  #or x="date", y="value"
  #dimplejs allows filtering but will lessen data to write
  #if we subset in R
  #data = subset(ust.melt,maturity==10),  #get all data for 10y maturity
  data = p1,
  type = 'line',
  bounds = list(x=60, y=2, width=420, height=330)
)
d4