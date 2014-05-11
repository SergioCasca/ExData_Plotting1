source('read_data.R')

# read data
ds <- read_data()

# open connection
png('figure/plot2.png',width = 480, height = 480)

#plot
plot(type="l", y=ds$Global_active_power, x=ds$DateTime, ylab="Global Active Power (kilowatts)", xlab="")


dev.off()
