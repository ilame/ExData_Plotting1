require(sqldf)
file<-c("./household_power_consumption.txt")
##read.csv.sql function Reads a file into R filtering it with an sql statement. Only the filtered portion is processed by R
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
png("plot1.png",width=480,height=480,units="px")
hist(data_subset$Global_active_power, breaks=12,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
