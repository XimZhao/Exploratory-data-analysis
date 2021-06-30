library(tidyverse)
library(lubridate)
hhpc <- read_delim("D:\\coursera\\EDA_Coursera\\household_power_consumption.txt",delim = ";")

hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Datetime <- paste(hhpc$Date, hhpc$Time, sep=" ")
hhpc$DT <- strptime(hhpc$Datetime, "%Y-%m-%d %H:%M:%S", tz = "EST")

hhpc_s <- hhpc %>% filter(DT>="2007-02-01" & DT < "2007-02-03")

hhpc_s$weekday <-weekdays(hhpc_s$DT)

#plot1

# calling the basic plot function
plot(hhpc_s$DT,hhpc_s$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
png(filename = "plot2.png",
    width = 480, height = 480)