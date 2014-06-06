# power consumption dataset 
# only data for Feb 1 and 2, 2007 will be read into R
library(sqldf)
epc<-read.csv2.sql('household_power_consumption.txt',
sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")

hist(epc[,3], main="Global Active Power", xlab="Global Active Power (kilowatts)",
ylab="Frequency", col='red')

dev.copy(device=png, file="plot1.png")
dev.off()
