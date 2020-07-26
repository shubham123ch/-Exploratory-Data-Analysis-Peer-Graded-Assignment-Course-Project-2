# Subset the coal combustion related NEI data
Combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
Coal_Related <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
Coal_Combustion <- (Combustion & Coal_Related)
Combustion_SCC <- SCC[Coal_Combustion,]$SCC
Combustion_NEI <- NEI[NEI$SCC %in% Combustion_SCC,]

png("plot4.png",width=500,height=500,units="px",bg="transparent")

library(ggplot2)

ggplot <- ggplot(Combustion_NEI,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggplot)
