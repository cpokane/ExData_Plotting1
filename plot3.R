#####################################################################
# Code for Plot3 from Exploratory Data Analyis: Course 1
#
# NB: Needs file "household_power_consumption.txt" to be in working directory
#####################################################################

# Reading in data
initial <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Reformatting date and time variables
initial$Time <- paste(initial$Date, initial$Time, sep = " ")
initial$Time <- strptime(initial$Time, format = "%d/%m/%Y %H:%M:%S")
initial$Date <- as.Date(initial$Date, format = "%d/%m/%Y")

# Subsetting date range and removing unwanted data
Energy <- subset(initial, initial$Date == "2007-02-01" | initial$Date == "2007-02-02")
rm(initial)

# Plot3 
png(file = "plot3.png") 
with(Energy, plot(Time, Sub_metering_1, type = "n", xlab ="", ylab = "", main = ""))
with(Energy, points(Time, Sub_metering_1, type = "l"))
with(Energy, points(Time, Sub_metering_2, type = "l", col = "red"))
with(Energy, points(Time, Sub_metering_3, type = "l", col = "blue"))
title(ylab = "Energy sub metering")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


