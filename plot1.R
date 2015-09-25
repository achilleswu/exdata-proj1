d<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
d$Date<-strptime(d$Date, "%d/%m/%Y")
i<-(as.Date(d$Date) >= as.Date("2007-02-01") & as.Date(d$Date) <= as.Date("2007-02-02"))
data<-d[i,]

png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
