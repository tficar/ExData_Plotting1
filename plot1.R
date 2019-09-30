library(chron)

# Read data in
dat <- read.table("C:\\Users\\tficarro\\Downloads\\household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Format date and time columns
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time = chron(times. = format(dat$Time, format = "%H:%M:%S"))

# Subset only the days we need
dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02", ]

# Graph 1
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()