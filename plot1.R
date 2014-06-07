data <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
logical <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
subset <- subset(data, logical)
png(filename="plot1.png")
hist(as.numeric(subset$Global_active_power),col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
axis(side=2,at=1200,labels="1200")
dev.off()