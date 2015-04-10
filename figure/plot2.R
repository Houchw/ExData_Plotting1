myfile <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     stringsAsFactors = FALSE)
mydata <- subset(myfile, Date == "1/2/2007" | Date == "2/2/2007")
time <- paste(mydata$Date, mydata$Time, sep = " ")
time <- strptime(time, "%d/%m/%Y %H:%M:%S", tz = "UTC")
mydata$Date <- as.Date(time)
mydata$Time <- time
mydata[, 3] <- as.numeric(mydata[, 3])
png("plot2.png")
plot(x = mydata$Time, y = mydata[, 3], type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()