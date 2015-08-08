powerconsumption <- "./household_power_consumption.txt"
powerconsumptiondata <- read.table(powerconsumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersubset <- data[powerconsumptiondata$Date %in% c("1/2/2007","2/2/2007") ,]

datentime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(powersubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datentime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 
