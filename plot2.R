# Loading the data from file
# dt <- read.table(".\\exdata_data_household_power_consumption\\household_power_consumption.txt",header=TRUE,sep=";")
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

# Plot time-series of Global Active Power for 2007-02-01 to 2007-02-02
png(file="plot2.png", bg="white", width=480, height=480, units="px")
plot(x = dt2$TimeFm, y = dt2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()