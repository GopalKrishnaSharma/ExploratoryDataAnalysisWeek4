#read datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data from Baltimore and for OnRoad type
NEI_Baltimore_OnRoad = subset(NEI, NEI$fips == "24510"&NEI$type=="ON-ROAD")

#sum PM2.5 by year
TotalEmission_Baltimore_OnRoad <- aggregate(NEI_Baltimore_OnRoad[,4],by = list(year = NEI_Baltimore_OnRoad$year), FUN = sum)

#plot the data
png(filename = 'plot5.png')
barplot(TotalEmission_Baltimore_OnRoad$x, names.arg = TotalEmission_Baltimore_OnRoad$year, xlab = "year", ylab = "Total Emission", main = "Total emission by motor vehicles (On Road) in Baltimore")
dev.off()
