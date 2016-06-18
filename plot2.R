#
# COURSERA Data Science Specialization
# Exploratory Data Analysis
# Alexis Van Espen
# Plot 2
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
png("plot2.png")

par(cex = 0.80,
    font = 2)

# Make plot.
plot(d.power2$date_time,
     d.power2$global_active_power,
     main = NULL,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# Close graphics device.
dev.off()

