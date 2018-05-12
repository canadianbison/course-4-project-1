
#Download the "Electric power consumption" dataset into working directory and unzip the file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
install.packages("downloader")
library(downloader)
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip")

#Load only records with dates that are "2007-02-01" and "2007-02-02"
library(sqldf)
dataset <- read.csv.sql("household_power_consumption.txt",sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",header = TRUE, sep = ";")

#Plot 1 - create a histogram for Global Active Power
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col='red', breaks=12)
dev.off()
