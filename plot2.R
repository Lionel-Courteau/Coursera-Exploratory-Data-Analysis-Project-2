source("downloadEPAarchive.R")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate by sum the total emissions by year
aggBaltimoreTotals <- aggregate(Emissions ~ year,baltimoreNEI, sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (aggBaltimoreTotals$Emissions)/10^6,
  names.arg=aggBaltimoreTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All Baltimore Sources"
)

dev.off()