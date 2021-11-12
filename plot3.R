# Reading the data 
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

# Subsetting data from the dates 2007-02-01 and 2007-02-02.
reqData <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")

# Changing the class to numeric
reqData$Sub_metering_1 <- as.numeric(reqData$Sub_metering_1)
reqData$Sub_metering_2 <- as.numeric(reqData$Sub_metering_2)
reqData$Sub_metering_3 <- as.numeric(reqData$Sub_metering_3)

# Changing the class of Date and Time column
reqData$Date <- as.Date(reqData$Date, "%d/%m/%Y")
reqData$Time <- strptime(reqData$Time, "%H:%M:%S")
reqData[1:1440, "Time"] <- format(reqData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
reqData[1441:2880, "Time"] <- format(reqData[1441:2880 , "Time"], "2007-02-02 %H:%M:%S")

# Drawing plot
plot(reqData$Time, reqData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(reqData$Time, reqData$Sub_metering_1, col = "black")
lines(reqData$Time, reqData$Sub_metering_2, col = "red")
lines(reqData$Time, reqData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue") )
#copying plot to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()