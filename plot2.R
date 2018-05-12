
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

#Plot 2 - create a plot for Global Active Power by date and time
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dataset$DT,dataset$Global_active_power,type="l",xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()


