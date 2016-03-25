
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

## plotting (plot1.R)
## Global_active_power (x) vs Frecuency (y)
## changing Global_active_power "character class" to a numeric class one.
gap <- as.numeric(subset_data$Global_active_power)

## copying to a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()
