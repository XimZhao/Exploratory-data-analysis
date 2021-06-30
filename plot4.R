library(tidyverse)
library(lubridate)
hhpc <- read_delim("D:\\coursera\\EDA_Coursera\\household_power_consumption.txt",delim = ";")

hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Datetime <- paste(hhpc$Date, hhpc$Time, sep=" ")
hhpc$DT <- strptime(hhpc$Datetime, "%Y-%m-%d %H:%M:%S", tz = "EST")

hhpc_s <- hhpc %>% filter(DT>="2007-02-01" & DT < "2007-02-03")

hhpc_s$weekday <-weekdays(hhpc_s$DT)

#plot4

# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(hhpc_s,{
  plot(hhpc_s$DT,as.numeric(as.character(hhpc_s$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(hhpc_s$DT,as.numeric(as.character(hhpc_s$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(hhpc_s$DT,hhpc_s$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(hhpc_s,lines(DT,as.numeric(as.character(Sub_metering_1))))
  with(hhpc_s,lines(DT,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(hhpc_s,lines(DT,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(hhpc_s$DT,as.numeric(as.character(hhpc_s$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})