# We download the data
consumption_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp <- tempfile()
download.file(consumption_url, temp)
unzip(temp)

# We read the data into a data frame
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     colClasses = c(rep("character", 2), rep("numeric", 7)), 
                     na.strings = "?")

# We filter the data for only two days and format the dates
mydata_subset <- subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

mydata_subset$Date <- as.Date(mydata_subset$Date, format = "%d/%m/%Y")
mydata_subset$DateTime <- strptime(paste(mydata_subset$Date, mydata_subset$Time), "%Y-%m-%d %X")

par(mfcol = c(2,2), mar = c(5, 5, 2, 2))

# We plot the data at the top left
plot(mydata_subset$DateTime, mydata_subset$Global_active_power, 
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "line")

# We plot the data at the bottom left
plot(mydata_subset$DateTime, mydata_subset$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", 
     type = "line", col = "black")

points(mydata_subset$DateTime, mydata_subset$Sub_metering_2, 
       type = "line", col = "red")
points(mydata_subset$DateTime, mydata_subset$Sub_metering_3, 
       type = "line", col = "blue")

legend("topright", lwd = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))

# We plot the data at the top right
plot(mydata_subset$DateTime, mydata_subset$Voltage, 
     xlab = "datetime", ylab = "Voltage", 
     type = "line")

# We plot the data at the bottom right
plot(mydata_subset$DateTime, mydata_subset$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", 
     type = "line")

# We save the plot into a png
png("plot4.png", width = 480, height = 480)
# We plot the data at the top left
plot(mydata_subset$DateTime, mydata_subset$Global_active_power, 
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "line")

# We plot the data at the bottom left
plot(mydata_subset$DateTime, mydata_subset$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", 
     type = "line", col = "black")

points(mydata_subset$DateTime, mydata_subset$Sub_metering_2, 
       type = "line", col = "red")
points(mydata_subset$DateTime, mydata_subset$Sub_metering_3, 
       type = "line", col = "blue")

legend("topright", lwd = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))

# We plot the data at the top right
plot(mydata_subset$DateTime, mydata_subset$Voltage, 
     xlab = "datetime", ylab = "Voltage", 
     type = "line")

# We plot the data at the bottom right
plot(mydata_subset$DateTime, mydata_subset$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", 
     type = "line")
dev.off()
