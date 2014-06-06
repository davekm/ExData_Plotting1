# read in power consumption data for Feb 1 and 2, 2007 
library(sqldf)
epc<-read.csv2.sql('household_power_consumption.txt',
sql = "select * from file where date='1/2/2007' or date='2/2/2007' ")

# add date/time field to end of epc data frame
epc$dt<-strptime(paste(epc$Date, epc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(epc$dt, epc[,3], main="", xlab="",
ylab="Global Active Power (kilowatts)", type='l')

dev.copy(device=png, file="plot2.png", width=480, height=480)
dev.off()
