# Reading the data 
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

# Subsetting data from the dates 2007-02-01 and 2007-02-02.
reqData <- subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")

# Changing the class of Global_active_power from character to numeric
reqData$Global_active_power <- as.numeric(reqData$Global_active_power)

# Drawing plot
hist(reqData$Global_active_power, col = "red", main = "Global Active Power")

#copying plot to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()