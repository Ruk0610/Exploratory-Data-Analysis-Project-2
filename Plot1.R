# Setting up working directory

setwd("C:/Users/ravi/Desktop/Ruk Coursera/Exploratory data analysis/exdata%2Fdata%2FNEI_data")

# Read the data into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sampling
NEI_sample <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# For each of the years 1999, 2002, 2005, and 2008.

# Generating the graph in the same directory as the source code

if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot1.png')

# Plot1
barplot(Emissions$PM, names.arg=Emissions$Group.1, 
  main=expression('Total Emission of PM'[2.5]), 
    xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons'))
)

dev.off()
