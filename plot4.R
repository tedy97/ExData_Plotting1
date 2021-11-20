library(data.table)

dt <- fread("household_power_consumption.txt", 
            sep = ";",
            col.names = colnames(read.table("household_power_consumption.txt", sep = ";" ,nrow = 1, header = TRUE )),
            skip = (46 * 1440) + (6 * 60 + 37),
            nrows = 48 * 60,
            na.strings="?"
)

dt[, DateTime := as.POSIXct(paste(dt[,Date], dt[,Time]), format = "%d/%m/%Y %H:%M:%S")]

par(mfrow=c(2,2))

plot(x = dt[, DateTime],
     y = dt[, Global_active_power],
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(x = dt[, DateTime],
     y = dt[, Voltage],
     type="l", xlab="", ylab="Voltage")

plot(dt[, DateTime], dt[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dt[, DateTime], dt[, Sub_metering_2], col="red")
lines(dt[, DateTime], dt[, Sub_metering_3], col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

plot(x = dt[, DateTime],
     y = dt[, Global_reactive_power],
     type="l", xlab="", ylab="Global Reeactive Power (kilowatts)")

dev.copy(png, file = "plot4.png")
dev.off()