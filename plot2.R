# Coursera Explaratory Data Analysis - PA1.3
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

# get list of times for each measurement
mytime <- strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S")

# swithing to English names of days
Sys.setlocale("LC_TIME", "English")

# plot data
plot(mytime,mydata$Global_active_power,type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

# save the plot
dev.copy(png,'plot2.png',width=800, height=800)
dev.off()


