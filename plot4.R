source('read_data.R')

# read data
ds <- read_data()

# keep settings
oldpar = par()


# open connection
png('figure/plot4.png',width = 480, height = 480)

# combining plots
par(mfrow=c(2,2))

# (1,1)
plot(type="l",y=ds$Global_active_power,x=ds$DateTime,ylab="Global Active Power",xlab="")

# (2,1)
plot(type="l",y=ds$Voltage,x=ds$DateTime,ylab="Voltage",xlab="datetime")

# (1,2)
plot(type="l",y=ds$Sub_metering_1,x=ds$DateTime,col="black",ylab="Energy sub metering",xlab="") + 
  lines(type="l",y=ds$Sub_metering_2,x=ds$DateTime,col="red") + 
  lines(type="l",y=ds$Sub_metering_3,x=ds$DateTime,col="blue") + 
  legend('topright', names(ds)[5:7] , bty="n", lty=1, col=c('black', 'red', 'blue'),  cex=.9)

# (2,2)
plot(type="l",y=ds$Global_reactive_power,x=ds$DateTime,ylab='Global_reactive_power',xlab="datetime")

#restore settings
par(oldpar)


dev.off()
