library(lubridate)

initial <- initial<- read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?")
initial$"Date" <- dmy (initial$"Date")
initial$"Time"<- hms(initial$"Time")
initial$"Date"<-initial$"Date"+initial$"Time"
initial$"Time"<-NULL

initial<-subset(initial, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))


"Plot 3"
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(initial$Date, initial$Sub_metering_1, type='l',xlab="", ylab='Energy sub metering')
lines(initial$Date, initial$Sub_metering_2, col='red')
lines(initial$Date, initial$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'),lty='solid')

dev.off()
