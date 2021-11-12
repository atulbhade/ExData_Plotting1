# Reading the data 
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

# Subsetting data from the dates 2007-02-01 and 2007-02-02.
reqData <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")

# Changing the class of Global_active_power from character to numeric
reqData$Global_active_power <- as.numeric(reqData$Global_active_power)

# Changing the class of Date and Time column
reqData$Date <- as.Date(reqData$Date, "%d/%m/%Y")
reqData$Time <- strptime(reqData$Time, "%H:%M:%S")
reqData[1:1440, "Time"] <- format(reqData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
reqData[1441:2880, "Time"] <- format(reqData[1441:2880 , "Time"], "2007-02-02 %H:%M:%S")

# Drawing plot
plot(reqData$Time, reqData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#copying plot to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

