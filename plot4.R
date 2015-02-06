# Coursera Explaratory Data Analysis - PA1.3
# matyas.theuer@gmail.com
# 2015/02/06

# clear workspace
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
mydata <- cbind(mydata,strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S"))
colnames(mydata)[10] <- "mytime"

# swithing to English names of days
Sys.setlocale("LC_TIME", "English")

# plot data
par(mfrow=c(2,2))

# top left
plot(mydata$mytime,mydata$Global_active_power,type="l", xlab="",
     ylab="Global Active Power")

#top right
plot(mydata$mytime,mydata$Voltage,type="l", xlab="datetime",
     ylab="Voltage")

# bottom left
plot(mydata$mytime,mydata$Sub_metering_1,type="l",col="black", xlab="",
      ylab="Energy sub metering")
lines(mydata$mytime,mydata$Sub_metering_2,col="red")
lines(mydata$mytime,mydata$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1), col = c("black","blue", "red"), cex = 0.75,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# bottom right
plot(mydata$mytime,mydata$Global_reactive_power,type="l", xlab="datetime",
     ylab="Global_reactive_power")

# save the plot
dev.copy(png,'plot4.png',width=800, height=800)
dev.off()
