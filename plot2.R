library(lubridate)
Sys.setlocale("LC_TIME", "C")

Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
Data$Date <- dmy(Data$Date)
Data$Global_active_power <- as.numeric(Data$Global_active_power)

SubData <-  subset(Data, Data$Date == "2007-02-01" | Data$Date == "2007-02-02")
SubData$DateandTime <- ymd_hms(paste(SubData$Date,SubData$Time))


png(file = "plot2.png")
plot(SubData$DateandTime, SubData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()

