library(lubridate)
Sys.setlocale("LC_TIME", "C")

Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
Data$Global_active_power <- as.numeric(Data$Global_active_power)
Data$Date <- dmy(Data$Date)

SubData <-  subset(Data, Data$Date == "2007-02-01" | Data$Date == "2007-02-02")

png(file = "plot1.png")
par(cex.axis = 0.8)
par(cex.main = 1.2)
with(SubData, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(1,1200)))
dev.off()

