# Read data
power_data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = FALSE)

# Format date, time
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
datetime <- paste(power_data$Date, power_data$Time)
power_data$Datetime <- as.POSIXct(datetime)

# Subsetting data
plotdata <- subset(power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_data)

## Plotting data
hist(plotdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()