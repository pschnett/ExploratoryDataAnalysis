file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
file.dest <- 'household_power_consumption.txt'
download.file(file.url, file.dest, method='curl')

## Getting full dataset
dataFull <- read.csv("./R/ExploratoryDataAnalysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
## Subsetting the data to only 2 days
data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFull)

##  convert the Date and Time variables to Date/Time classes in R
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1, household energy usage varies over a 2-day period in February, 2007 as a histogram
## Title should be Global Active Power, with red cols and modifying the x and y labels 
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file to a png that is 480 by 480
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
