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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plotdata, {
        plot(Global_active_power ~ Datetime, type="l", ylab="Global Active Power", xlab="")
        plot(Voltage ~ Datetime, type="l", ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2 ~ Datetime, col='Red')
        lines(Sub_metering_3 ~ Datetime, col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
