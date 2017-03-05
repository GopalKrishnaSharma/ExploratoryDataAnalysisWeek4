#read datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data concerning to "coal" from scc dataset
SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]

#merge the extracted scc dataset and NEI dataset
NEI_coal <- merge(NEI, SCC_coal, by = "SCC")

#sum the pm2.5 by year
TE_coal_year <- aggregate(NEI_coal[,4], by = list(year = NEI_coal$year),FUN = sum)

#plot the data
png("plot4.png")
barplot(TE_coal_year$x, names.arg = TE_coal_year$year, xlab = "year", ylab = "Total Emission", main = "Total Coal emission")
dev.off()
