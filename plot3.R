# Plot 3

# Load Data
data <- read.table(file = "C:/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Subset date range
plot_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Convert Measure to Numeric
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)

# Convert Date and Time
plot_data$DateTime <- as.POSIXct(paste(as.Date(plot_data$Date, format = "%d/%m/%Y"), plot_data$Time))

# Make Plot
png("plot3.png", width=480, height=480)
with(plot_data, {
  plot(Sub_metering_1 ~ DateTime, type = "l", xlab=  "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ DateTime,col='Red')
  lines(Sub_metering_3 ~ DateTime,col='Blue')
})
legend(
  "topright",
  col = c("black", "red", "blue"), 
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = 1, lwd = 2)
dev.off()