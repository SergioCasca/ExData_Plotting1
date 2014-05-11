read_data <- function()
{
    ds <- read.csv('data/household_power_consumption.txt',header=TRUE, sep=";",colClasses=c(NA,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL))
    ds$Date <- as.Date(ds$Date,format="%d/%m/%Y")
    start<-which(ds$Date == as.Date('2007-02-01'))[1]
    end<-tail(which(ds$Date == as.Date('2007-02-02')),1)
    column_names <- names(ds)
    ds <- read.csv('data/household_power_consumption.txt',header=TRUE, skip=start, nrows=end-start, sep=";", col.names=column_names)
    
    ds$DateTime <- paste(ds$Date,ds$Time)
    ds$DateTime <- strptime(ds$DateTime,format="%d/%m/%Y %H:%M:%S")
    ds <- ds[,-1:-2]
    ds
}








