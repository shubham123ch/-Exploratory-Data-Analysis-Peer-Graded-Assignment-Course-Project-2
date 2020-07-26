# Gather the subset of the NEI data 
Vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
Vehicles_SCC <- SCC[Vehicles,]$SCC
Vehicles_NEI <- NEI[NEI$SCC %in% Vehicles_SCC,]

# Subset the vehicles NEI data by each city's fip
Vehicles_Baltimore_NEI <- Vehicles_NEI[vehicles_NEI$fips=="24510",]
Vehicles_Baltimore_NEI$city <- "Baltimore City"

Vehicles_LANEI <- Vehicles_NEI[Vehicles_NEI$fips=="06037",]
Vehicles_LANEI$city <- "Los Angeles County"

# Combine the two subsets 
Combine_NEI <- rbind(Vehicles_Baltimore_NEI,Vehicles_LANEI)

png("plot6.png",width=500,height=500,units="px",bg="transparent")

library(ggplot2)
 
ggplot <- ggplot(Combine_NEI, aes(x=factor(year), y=Emissions, fill=city)) + geom_bar(aes(fill=year),stat="identity") +
 facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
 labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
 
print(ggplot)
