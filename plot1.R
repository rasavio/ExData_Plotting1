# Plot 1

# Load Data
data <- read.table(file = "C:/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Subset date range
plot_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Convert Measure to Numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

# Make Plot
png("plot1.png", width=480, height=480)
with(plot_data, hist(Global_active_power, col = "red", main = "Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()