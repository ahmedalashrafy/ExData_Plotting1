library(lubridate)

initial <- initial<- read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?")
initial$"Date" <- dmy (initial$"Date")
initial$"Time"<- hms(initial$"Time")
initial$"Date"<-initial$"Date"+initial$"Time"
initial$"Time"<-NULL

initial<-subset(initial, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

"plot 2"
png(filename='plot2.png', width=480, height=480)
plot(test$Date , test$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='', type='l')
dev.off()
