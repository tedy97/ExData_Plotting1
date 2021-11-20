library(data.table)

dt <- fread("household_power_consumption.txt", 
                 sep = ";",
                 col.names = colnames(read.table("household_power_consumption.txt", sep = ";" ,nrow = 1, header = TRUE )),
                 skip = (46 * 1440) + (6 * 60 + 37),
                 nrows = 48 * 60,
                 na.strings="?"
)


dt[, DateTime := as.POSIXct(paste(dt[,Date], dt[,Time]), format = "%d/%m/%Y %H:%M:%S")]


plot(x = dt[, DateTime],
     y = dt[, Global_active_power],
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
