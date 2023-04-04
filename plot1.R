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

# Plot Histogram of Global Active Power
png(file="plot1.png", bg="white", width=480, height=480, units="px")
hist(dt2$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()