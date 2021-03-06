powerconsumption <- "./household_power_consumption.txt"
powerconsumptiondata <- read.table(powerconsumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersubset <- data[powerconsumptiondata$Date %in% c("1/2/2007","2/2/2007") ,]

datentime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(powersubset$Global_active_power)
submetering1 <- as.numeric(powersubset$Sub_metering_1)
submetering2 <- as.numeric(powersubset$Sub_metering_2)
submetering3 <- as.numeric(powersubset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datentime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datentime, submetering2, type="l", col="red")
lines(datentime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 
