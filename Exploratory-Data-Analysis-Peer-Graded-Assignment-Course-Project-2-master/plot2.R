# Subset NEI data by Baltimore's fip.
Baltimore_NEI <- NEI[NEI$fips=="24510",]

#Summing the Baltimore emissions data by year
Baltimore_Emissions <- aggregate(Emissions ~ year, Baltimore_NEI,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(Baltimore_Emissions$Emissions, names.arg=Baltimore_Emissions$year,xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From all Baltimore City Sources")
