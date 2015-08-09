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
with(plotdata, {
        plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2 ~ Datetime, col='Red')
        lines(Sub_metering_3 ~ Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()