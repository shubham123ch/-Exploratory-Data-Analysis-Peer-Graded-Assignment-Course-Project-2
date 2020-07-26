# Gather the subset of the NEI data 
Vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
Vehicles_SCC <- SCC[Vehicles,]$SCC
Vehicles_NEI <- NEI[NEI$SCC %in% Vehicles_SCC,]

# Subset the vehicles NEI data to Baltimore's fip
Baltimore_Vehicles_NEI <- Vehicles_NEI[Vehicles_NEI$fips=="24510",]

png("plot5.png",width=500,height=500,units="px",bg="transparent")

library(ggplot2)

ggplot <- ggplot(Baltimore_Vehicles_NEI,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggplot)
