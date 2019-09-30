library(chron)

# Read data in
dat <- read.table("C:\\Users\\tficarro\\Downloads\\household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Format date and time columns
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time = chron(times. = format(dat$Time, format = "%H:%M:%S"))
dat$datetime <- chron(dates=as.character(dat$Date), times=dat$Time,format=c('Y-M-D', 'h:m:s'))

# Subset only the days we need
dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02", ]

# Graph 2
plot(dat$datetime, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "")
lines(dat$datetime, dat$Sub_metering_2, col = "red")
lines(dat$datetime, dat$Sub_metering_3, col = "blue")
lab <- c("Thu", "Fri", "Sat")
axis(1, at = c(13545.0, 13546.0, 13547.0), labels = lab)
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()