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

## Plot 2 as a line plot(type 1) and modify the y label
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file to a png that is 480 by 480
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
