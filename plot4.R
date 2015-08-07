powerconsumption <- "./household_power_consumption.txt"
powerconsumptiondata <- read.table(powerconsumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersubset <- data[powerconsumptiondata$Date %in% c("1/2/2007","2/2/2007") ,]

datentime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(powersubset$Global_active_power)
reactivepower <- as.numeric(powersubset$Global_reactive_power)
voltage <- as.numeric(powersubset$Voltage)
submetering1 <- as.numeric(powersubset$Sub_metering_1)
submetering2 <- as.numeric(powersubset$Sub_metering_2)
submetering3 <- as.numeric(powersubset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datentime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datentime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datentime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datentime, submetering2, type="l", col="red")
lines(datentime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datentime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 
