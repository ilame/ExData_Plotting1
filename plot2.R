require(sqldf)
file <- c("./household_power_consumption.txt")
##read.csv.sql function Reads a file into R filtering it with an sql statement. Only the filtered portion is processed by R
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480,units="px")
plot(dateTime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
