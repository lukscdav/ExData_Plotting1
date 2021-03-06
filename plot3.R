data <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
logical <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
subset <- subset(data, logical)
png(filename="plot3.png")
# I have Czech locale + Windows OS. To produce correct x-axis labels, 
# I had to use the next line that works only on Windows. 
Sys.setlocale("LC_TIME", "English")
plot(as.POSIXct(strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")),
     as.numeric(subset$Global_active_power),ylab="Energy sub metering",
     xlab="",type="n",ylim=c(0,39))
lines(as.POSIXct(strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")),
      as.numeric(subset$Sub_metering_1))
lines(as.POSIXct(strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")),
      as.numeric(subset$Sub_metering_2),col="red")
lines(as.POSIXct(strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")),
      as.numeric(subset$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()