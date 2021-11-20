library(data.table)

dt <- fread("household_power_consumption.txt", 
            sep = ";",
            col.names = colnames(read.table("household_power_consumption.txt", sep = ";" ,nrow = 1, header = TRUE )),
            skip = (46 * 1440) + (6 * 60 + 37),
            nrows = 48 * 60,
            na.strings="?"
)

dt[, DateTime := as.POSIXct(paste(dt[,Date], dt[,Time]), format = "%d/%m/%Y %H:%M:%S")]

plot(dt[, DateTime], dt[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dt[, DateTime], dt[, Sub_metering_2], col="red")
lines(dt[, DateTime], dt[, Sub_metering_3], col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.copy(png, file = "plot3.png")
dev.off()