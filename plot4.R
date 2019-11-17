# Plot 4

# Load Data
data <- read.table(file = "C:/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Subset date range
plot_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Convert Measure to Numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)
plot_data$Global_reactive_power <- as.numeric(plot_data$Global_reactive_power)
plot_data$Voltage <- as.numeric(plot_data$Voltage)
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)

# Convert Date and Time
plot_data$DateTime <- as.POSIXct(paste(as.Date(plot_data$Date, format = "%d/%m/%Y"), plot_data$Time))

# Make Plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(plot_data, {
  plot(Global_active_power ~ DateTime, type = "l", xlab=  "", ylab = "Global Active Power (kilowatts)")
  plot(Voltage ~ DateTime, type = "l", xlab=  "datetime", ylab = "Voltage")
  plot(Sub_metering_1 ~ DateTime, type = "l", xlab=  "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ DateTime,col='Red')
  lines(Sub_metering_3 ~ DateTime,col='Blue')
  legend(
    "topright",
    col = c("black", "red", "blue"), 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1, lwd = 2)
  plot(Global_reactive_power ~ DateTime, type = "l", xlab=  "datetime", ylab = "Global_reactive_power")
})
dev.off()