library(tidyverse)
library(lubridate)
hhpc <- read_delim("D:\\coursera\\EDA_Coursera\\household_power_consumption.txt",delim = ";")

hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Datetime <- paste(hhpc$Date, hhpc$Time, sep=" ")
hhpc$DT <- strptime(hhpc$Datetime, "%Y-%m-%d %H:%M:%S", tz = "EST")

hhpc_s <- hhpc %>% filter(DT>="2007-02-01" & DT < "2007-02-03")

hhpc_s$weekday <-weekdays(hhpc_s$DT)

#plot3


# calling the basic plot functions
plot(hhpc_s$DT,hhpc_s$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(hhpc_s,lines(DT,as.numeric(as.character(Sub_metering_1))))
with(hhpc_s,lines(DT,as.numeric(as.character(Sub_metering_2)),col="red"))
with(hhpc_s,lines(DT,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png(filename = "plot2.png",
    width = 480, height = 480)