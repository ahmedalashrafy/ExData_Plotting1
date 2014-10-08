
library(lubridate)

initial <- initial<- read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?")
initial$"Date" <- dmy (initial$"Date")
initial$"Time"<- hms(initial$"Time")
initial$"Date"<-initial$"Date"+initial$"Time"
initial$"Time"<-NULL

initial<-subset(initial, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))



"Plot 4"
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
plot(initial$Date, initial$Global_active_power,ylab='Global Active Power', xlab='', type='l')
plot(initial$Date, initial$Voltage,xlab='datetime', ylab='Voltage', type='l')
plot(initial$Date, initial$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(initial$Date, initial$Sub_metering_2, col='red')
lines(initial$Date, initial$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'),lty='solid', bty='n')
plot(initial$Date, initial$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()
