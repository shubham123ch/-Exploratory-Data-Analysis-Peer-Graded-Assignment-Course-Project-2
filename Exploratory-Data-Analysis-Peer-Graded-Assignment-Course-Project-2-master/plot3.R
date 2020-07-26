# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimore_NEI <- NEI[NEI$fips=="24510",]

# Summing the Baltimore emissions data by year
Baltimore_Emissions <- aggregate(Emissions ~ year, Baltimore_Emissions,sum)

png("plot3.png",width=500,height=500,units="px",bg="transparent")

library(ggplot2)

ggplot <- ggplot(Baltimore_Emissions,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggplot)
