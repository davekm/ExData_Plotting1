# power consumption dataset subsetted using Linux tools
# only data for Feb 1 and 2, 2007 will be read into R
epc<-read.csv('epc.csv', stringsAsFactors=FALSE)

hist(epc[,3], main="Global Active Power", xlab="Global Active Power (kilowatts)",
ylab="Frequency", col='red')

dev.copy(device=png, file="plot1.png")
dev.off()
