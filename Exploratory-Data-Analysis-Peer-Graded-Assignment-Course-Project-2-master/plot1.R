#Download the data 
if(!file.exists("exdata-data-NEI_data.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
        unzip(temp)
        unlink(temp)
}

#load the NEI and SCC data frames from the .rds files.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Summing the total emissions by year
Emissions <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",units="px",bg="transparent")

barplot((aggTotals$Emissions)/10^6,names.arg=aggTotals$year,xlab="Year",ylab="PM2.5 Emissions (10^6 Tons)",main="Total PM2.5 Emissions From All US Sources")


