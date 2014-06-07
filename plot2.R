data <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
logical <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
subset <- subset(data, logical)
png(filename="plot2.png")
# I have Czech locale + Windows OS. To produce correct x-axis labels, 
# I had to use the next line that works only on Windows. 
Sys.setlocale("LC_TIME", "English")
plot(as.POSIXct(strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")),
     as.numeric(subset$Global_active_power),pch=".",
     ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(as.POSIXct(strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")),
      as.numeric(subset$Global_active_power))
dev.off()