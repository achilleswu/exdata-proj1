d<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
d$Date<-strptime(d$Date, "%d/%m/%Y")
i<-(as.Date(d$Date) >= as.Date("2007-02-01") & as.Date(d$Date) <= as.Date("2007-02-02"))
data<-d[i,]

s<-paste(as.character(data$Date), data$Time)
t<-strptime(s, "%Y-%m-%d %H:%M:%S")

library(ggplot2)
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(t, data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
plot(t, data$Voltage, type='l', xlab="datetime", ylab="Voltage")
plot(t, data$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering", )
lines(t, data$Sub_metering_2, type='l', col="red")
lines(t, data$Sub_metering_3, type='l', col="blue")
legend("topright", names(data)[7:9], lwd=1, col=c("black","red", "blue"))
plot(t, data$Global_reactive_power, type='l', xlab="datetime", ylab="Gloabal_reactive_power")
dev.off()
