# read in power consumption data for Feb 1 and 2, 2007 
library(sqldf)
epc<-read.csv2.sql('household_power_consumption.txt',
sql = " select * from file where date='1/2/2007' or date='2/2/2007' ")

# add date/time field to end of epc data frame
epc$dt<-strptime(paste(epc$Date, epc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename='plot3.png')

plot(epc$dt, epc[,7], main="", xlab="", ylab="Energy sub metering", type='l')
lines(epc$dt, epc[,8], col='red')
lines(epc$dt, epc[,9], col='blue')

legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
col=c('black','red','blue'), lty=1, lwd=2)

dev.off()
