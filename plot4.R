# read in power consumption data for Feb 1 and 2, 2007 
library(sqldf)
epc<-read.csv2.sql('household_power_consumption.txt',
sql = " select * from file where date='1/2/2007' or date='2/2/2007' ")

# add date/time field to end of epc data frame
epc$dt<-strptime(paste(epc$Date, epc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2)) # set up 2 by 2 grid for plots

plot(epc$dt, epc[,3], main="", xlab="", cex=0.8,
ylab="Global Active Power", type='l')

plot(epc$dt, epc$Voltage, main="", xlab="datetime", ylab="Voltage", type='l')

plot(epc$dt, epc[,7], main="", xlab="", ylab="Energy sub metering", type='l')
lines(epc$dt, epc[,8], col='red')
lines(epc$dt, epc[,9], col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
col=c('black','red','blue'),  bty='n', lty=1, lwd=2)

plot(epc$dt, epc[,4], main="", xlab="datetime", 
ylab="Global_reactive_power", type='l')

dev.copy(device=png, file="plot4.png")
dev.off()
