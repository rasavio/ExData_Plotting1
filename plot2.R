# Plot 2

# Load Data
data <- read.table(file = "C:/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Subset date range
plot_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Convert Measure to Numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

# Convert Date and Time
plot_data$DateTime <- as.POSIXct(paste(as.Date(plot_data$Date, format = "%d/%m/%Y"), plot_data$Time))

# Make Plot
png("plot2.png", width=480, height=480)
with(plot_data, plot(Global_active_power ~ DateTime, type = "l", xlab=  "", ylab = "Global Active Power (kilowatts)"))
dev.off()
