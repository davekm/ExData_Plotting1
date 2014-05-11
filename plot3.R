# power consumption dataset subsetted using Linux tools
# only data for Feb 1 and 2, 2007 will be read into R
epc<-read.csv('epc.csv', stringsAsFactors=FALSE)

# add date/time field to end of epc data frame
epc$dt<-strptime(paste(epc$Date, epc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

plot(epc$dt, epc[,7], main="", xlab="", ylab="Energy sub metering", type='n')
lines(epc$dt, epc[,7], col='black')
lines(epc$dt, epc[,8], col='red')
lines(epc$dt, epc[,9], col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
col=c('black','red','blue'), lty=1, lwd=2)

dev.copy(device=png, file="plot3.png")
dev.off()
