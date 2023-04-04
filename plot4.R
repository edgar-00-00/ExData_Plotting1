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
dt2$Global_active_power <- as.numeric(dt2$Global_active_power)
dt2$Sub_metering_1 <- as.numeric(dt2$Sub_metering_1)
dt2$Sub_metering_2 <- as.numeric(dt2$Sub_metering_2)
dt2$Sub_metering_3 <- as.numeric(dt2$Sub_metering_3)
dt2$Global_reactive_power <- as.numeric(dt2$Global_reactive_power)



# Plot 4 graphs for 2007-02-01 to 2007-02-02
png(file="plot4.png", bg="white", width=480, height=480, units="px")
par(mfrow=c(2,2), mar=c(4,4,1,1))

# Graph 1
plot(x = dt2$TimeFm, y = dt2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Graph 2 
plot(x=dt2$TimeFm, y = dt2$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Graph 3
plot(x = dt2$TimeFm, y = dt2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x = dt2$TimeFm, y = dt2$Sub_metering_2, col="red")
lines(x = dt2$TimeFm, y = dt2$Sub_metering_3, col="blue")
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1 , col=c("black","red","blue"))
# Graph 4
plot(x=dt2$TimeFm,y=dt2$Global_reactive_power,type="l",xlab="datetime",ylab = "Global_reative_power")

dev.off()