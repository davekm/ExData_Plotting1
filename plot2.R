# power consumption dataset subsetted using Linux tools
# only data for Feb 1 and 2, 2007 will be read into R
epc<-read.csv('epc.csv', stringsAsFactors=FALSE)

# add date/time field to end of epc data frame
epc$dt<-strptime(paste(epc$Date, epc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(epc$dt, epc[,3], main="", xlab="",
ylab="Global Active Power (kilowatts)", type='n')
lines(epc$dt, epc[,3])

dev.copy(device=png, file="plot2.png")
dev.off()
