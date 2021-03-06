require(sqldf)
file<-c("./household_power_consumption.txt")
##read.csv.sql function Reads a file into R filtering it with an sql statement. Only the filtered portion is processed by R
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data_subset$Global_active_power)
globalReactivePower <- as.numeric(data_subset$Global_reactive_power)
voltage <- as.numeric(data_subset$Voltage)
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
subMetering2 <- as.numeric(data_subset$Sub_metering_2) 
subMetering3 <- as.numeric(data_subset$Sub_metering_3)
png("plot4.png", width=480, height=480,units = "px")
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="n")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
