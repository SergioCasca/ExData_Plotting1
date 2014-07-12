source('read_data.R')

# read data
ds <- read_data()


# open connection
png('plot3.png',width = 480, height = 480)


#plot
plot(type="l",y=ds$Sub_metering_1,x=ds$DateTime,col="black",ylab="Energy sub metering",xlab="") + 
  lines(type="l",y=ds$Sub_metering_2,x=ds$DateTime,col="red") + 
  lines(type="l",y=ds$Sub_metering_3,x=ds$DateTime,col="blue") + 
  legend('topright', names(ds)[5:7] , lty=1, col=c('black', 'red', 'blue'),  cex=.9)


dev.off()
