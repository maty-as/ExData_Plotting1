# Coursera Explaratory Data Analysis - PA1.1
# matyas.theuer@gmail.com
# 2015/02/06

# cleat workspace
rm(list=ls())

# read zipped file
mydata <- read.table(unz("exdata-data-household_power_consumption.zip", 
                         "household_power_consumption.txt"),
                     sep = ";",stringsAsFactors = FALSE,
                     skip=66636,nrows=2880)
colnames(mydata) <- c("Date","Time","Global_active_power",
                      "Global_reactive_power","Voltage","Global_intensity",
                      "Sub_metering_1","Sub_metering_2","Sub_metering_3")   

# plot the data
hist(mydata$Global_active_power, main="Global active power",
     xlab="Global Active Power (kilowatts)",col = "red")

# save the plot
dev.copy(png,'plot1.png',width=800, height=800)
dev.off()