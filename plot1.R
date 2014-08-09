# source('read_data.R')
# # read data
# ds <- read_data()

rm(list = ls(all = TRUE)) 
Sys.setlocale("LC_TIME", "English")

# Read the whole file but only the Date column
ds <- read.csv('data/household_power_consumption.txt',header=TRUE, sep=";",colClasses=c(NA,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL))

# cast to Date objects
ds$Date <- as.Date(ds$Date,format="%d/%m/%Y")

# find start and end Row indexes
start<-which(ds$Date == as.Date('2007-02-01'))[1]
end<-tail(which(ds$Date == as.Date('2007-02-02')),1)

# retrieve features descriptions
column_names <- names(ds)

# read the dataset, conditioned to the row indexes
ds <- read.csv('data/household_power_consumption.txt',header=TRUE, skip=start, nrows=end-start, sep=";", col.names=column_names)

# create a new DateTime variable, character type
ds$DateTime <- paste(ds$Date,ds$Time)

# cast the variable to Date 
ds$DateTime <- strptime(ds$DateTime,format="%d/%m/%Y %H:%M:%S")

# exclude the Date and the Time original features
ds <- ds[,-1:-2]

# open connection
png('plot1.png',width = 480, height = 480)

#plot
hist(ds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()
