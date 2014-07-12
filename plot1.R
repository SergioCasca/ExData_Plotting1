source('read_data.R')

# read data
ds <- read_data()

# open connection
png('plot1.png',width = 480, height = 480)

#plot
hist(ds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()
