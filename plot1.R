powerconsumption <- "./household_power_consumption.txt"
powerconsumptiondata <- read.table(powerconsumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersubset <- data[powerconsumptiondata$Date %in% c("1/2/2007","2/2/2007") ,]

str(powersubset)
activepower <- as.numeric(powersubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(activepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()