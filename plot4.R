#
# COURSERA Data Science Specialization
# Exploratory Data Analysis
# Alexis Van Espen
# plot 2
#

# Load packages.
library(lubridate)
library(dplyr)

# Load data.
d.power <- read.table("household_power_consumption.txt",
                      header = TRUE, dec = ".", na.strings = "?", sep = ";")

# Reformat dataframe.
# I work on a copy of the dataframe so as to be able to mess around with dates and times,
# keeping the liberty to start back from the original data without having to load them again.
d.power2 <- d.power

names(d.power2) <- tolower(names(d.power))
d.power2$date_time <- paste(as.character(d.power$Date), as.character(d.power$Time))
d.power2$date_time <- dmy_hms(d.power2$date_time)
d.power2$date <- dmy(d.power$Date)
d.power2$time <- hms(d.power$Time)
d.power2 <- filter(d.power2, date >= "2007-02-01", date <= "2007-02-02")


# Construct plot.

# Open graphics device.
# The default size values match the requirements; no need to set them.
png("plot4.png")

par(cex = 0.80,
    font = 1,
    mfrow = c(2,2))

plot(d.power2$date_time,
     d.power2$global_active_power,
     main = NULL,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

plot(d.power2$date_time,
     d.power2$voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

# Make plot.
plot(d.power2$date_time,
     d.power2$sub_metering_1,
     main = NULL,
     xlab = "",
     ylab = "Energy sub metering",
     type = "n")

lines(d.power2$date_time,
      d.power2$sub_metering_1,
      col = "black")

lines(d.power2$date_time,
      d.power2$sub_metering_2,
      col = "red")

lines(d.power2$date_time,
      d.power2$sub_metering_3,
      col = "blue")

legend("topright",
       legend = c("sub-metering 1", "sub-metering 2", "sub-metering 3"),
       col = c("black", "red", "blue"),
       lty = 1)

plot(d.power2$date_time,
     d.power2$global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

# Close graphics device.
dev.off()

