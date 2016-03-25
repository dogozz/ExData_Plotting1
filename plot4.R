
## Dataset
## Downloading and reading
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "c:/coursera/Exploratory/Job1/household_power_consumption.zip")
unzip("c:/coursera/Exploratory/Job1/household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F, na.strings="?", dec = ".")

## The dataset has 2,075,259 rows (observations) and 9 columns (variables)
## dim(data)
## [1] 2075259       9
## Variables, [names(data)]
## [1] "Date"                  "Time"                  "Global_active_power"  
## [4] "Global_reactive_power" "Voltage"               "Global_intensity"     
## [7] "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3" 

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## Subsetting
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]
## dim(subset_data)
## [1] 2880    9 (2880 obs. 0f 9 variables)

## Plotting (plot4.R)
## Date and Time (x) vs Global_active_power (y) [1,1], Date and Time (x) vs Energy Sub metering 1, 2 and 3 (y),[2,1],
## Date and Time (x) vs Voltage (y) [1,2] and Date and Time (x) vs Global_reactive_power (y) [2,2]
## Changing "Sub_metering_1", "Sub_metering_2" and "Sub_metering_3" character classes to a numeric ones.
gap <- as.numeric(subset_data$Global_active_power)
submetering_1 <- as.numeric(subset_data$Sub_metering_1)
submetering_2 <- as.numeric(subset_data$Sub_metering_2)
submetering_3 <- as.numeric(subset_data$Sub_metering_3)
grp <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)

## Converting Date and Time variables to Date/Time classes using the strptime() 
date_and_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## copying to a png file
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow =c(2,2))

## Global active power[1,1]
plot(date_and_time, gap, type="l", xlab = "", ylab = "Global Active Power")

## Voltage [1,2]
plot(date_and_time, voltage, type="l", xlab = "datetime", ylab = "Voltage")

## Energy sub metering [2,1]
plot(date_and_time, submetering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(date_and_time, submetering_2, type = "l", col = "red")
lines(date_and_time, submetering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

## Global reactive power [2,2]
plot(date_and_time, grp, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
