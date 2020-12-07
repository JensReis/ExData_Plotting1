library(lubridate)
Sys.setlocale("LC_TIME", "C")

Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
Data$Date <- dmy(Data$Date)
Data$Global_active_power <- as.numeric(Data$Global_active_power)

SubData <-  subset(Data, Data$Date == "2007-02-01" | Data$Date == "2007-02-02")
SubData$DateandTime <- ymd_hms(paste(SubData$Date,SubData$Time))

png(file = "plot3.png")
plot(SubData$DateandTime, SubData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(SubData$DateandTime, SubData$Sub_metering_1, col = "black")
lines(SubData$DateandTime, SubData$Sub_metering_2, col = "red")
lines(SubData$DateandTime, SubData$Sub_metering_3, col = "blue")
legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.7)
dev.off()

