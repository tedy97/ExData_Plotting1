
# what to skip : (14+31 days * 24 hours * 60 minutes) + (6 hours * 60 minutes + 36 minutes) 

dt <- read.table("household_power_consumption.txt", 
                 sep = ";",
                 col.names = colnames(read.table("household_power_consumption.txt", sep = ";" ,nrow = 1, header = TRUE )),
                 skip = (46 * 1440) + (6 * 60 + 37),
                 nrows = 48 * 60
                 )

hist(dt$Global_active_power, xlab = "Global Active Power(kWatts)" ,col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
