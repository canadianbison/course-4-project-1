
#Download the "Electric power consumption" dataset into working directory and unzip the file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
install.packages("downloader")
library(downloader)
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip")

#Load only records with dates that are "2007-02-01" and "2007-02-02"
library(sqldf)
dataset <- read.csv.sql("household_power_consumption.txt",sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header = TRUE, sep = ";")
dataset$DT <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 3 - create a plot for sub-metering by date and time
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(dataset[,c("DT","Sub_metering_1")], plot(dataset$DT,dataset$Sub_metering_1,ylim=range(c(dataset$Sub_metering_1,dataset$Sub_metering_2,dataset$Sub_metering_3)),type="l",xlab = NA, ylab = "Energy sub metering"))
par(new = TRUE)
with(dataset[,c("DT","Sub_metering_2")], plot(dataset$DT,dataset$Sub_metering_2,ylim=range(c(dataset$Sub_metering_1,dataset$Sub_metering_2,dataset$Sub_metering_3)),type="l",xlab = NA, ylab = "Energy sub metering",col="red"))
par(new = TRUE)
with(dataset[,c("DT","Sub_metering_3")], plot(dataset$DT,dataset$Sub_metering_3,ylim=range(c(dataset$Sub_metering_1,dataset$Sub_metering_2,dataset$Sub_metering_3)),type="l",xlab = NA, ylab = "Energy sub metering",col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


