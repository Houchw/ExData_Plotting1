myfile <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     stringsAsFactors = FALSE)
mydata <- subset(myfile, Date == "1/2/2007" | Date == "2/2/2007")
time <- paste(mydata$Date, mydata$Time, sep = " ")
time <- strptime(time, "%d/%m/%Y %H:%M:%S", tz = "UTC")
mydata$Date <- as.Date(time)
mydata$Time <- time
mydata[, 7] <- as.numeric(mydata[, 7])
mydata[, 8] <- as.numeric(mydata[, 8])
mydata[, 9] <- as.numeric(mydata[, 9])
png("plot3.png")
plot(x = mydata$Time, y = mydata[, 7], type = "l", 
     xlab = "", ylab = "Energy Sub Metering")
lines(x = mydata$Time, y = mydata[, 8], type = "l", col = "red")
lines(x = mydata$Time, y = mydata[, 9], type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()