d<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
d$Date<-strptime(d$Date, "%d/%m/%Y")
i<-(as.Date(d$Date) >= as.Date("2007-02-01") & as.Date(d$Date) <= as.Date("2007-02-02"))
data<-d[i,]

s<-paste(as.character(data$Date), data$Time)
t<-strptime(s, "%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480, units="px")
plot(t, data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
