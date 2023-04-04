# Loading the data from file
#dt <- read.table(".\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=TRUE,sep=";")
dt <- read.table(unz(".\\exdata_data_household_power_consumption.zip", filename="household_power_consumption.txt"),header=TRUE,sep=";")

# Converting Date and Time to readable format
dt$DateFm <- as.Date(dt$Date, format="%d/%m/%Y")
dt$TimeFm <- strptime(paste(dt$Date,dt$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Filtering only the data for analysis from the date range
dt2 <- subset(dt, Date=="1/2/2007"|Date=="2/2/2007")

# Freeing memory
rm(dt)

# Preparing data for plotting
dt2$Sub_metering_1 <- as.numeric(dt2$Sub_metering_1)
dt2$Sub_metering_2 <- as.numeric(dt2$Sub_metering_2)
dt2$Sub_metering_3 <- as.numeric(dt2$Sub_metering_3)

# Plot time-series of Energy sub metering for 2007-02-01 to 2007-02-02
png(file="plot3.png", bg="white", width=480, height=480, units="px")
plot(x = dt2$TimeFm, y = dt2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x = dt2$TimeFm, y = dt2$Sub_metering_2, col="red")
lines(x = dt2$TimeFm, y = dt2$Sub_metering_3, col="blue")
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1 , col=c("black","red","blue"))
dev.off()