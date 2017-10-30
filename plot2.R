# Download and load data
datasetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
localZipFileName <- "household_power_consumption.zip"
fileNameInZip <- "household_power_consumption.txt"
download.file(datasetUrl, localZipFileName)
unzip(zipfile = localZipFileName)

data <- read.table(fileNameInZip, sep=";",na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE)
data <- data[grepl('^[1|2]/2/2007', data$Date),]
data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tzone="UTC")

# Make the plot
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Date, data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()