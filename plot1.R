#####################################################################
# Code for Plot1 from Exploratory Data Analyis: Course 1
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

# Plot1 
png(file = "plot1.png")
hist(Energy$Global_active_power, breaks = 16, col = "red", main = "", xlab ="")
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

