df <- read.table("dataset/household_power_consumption.txt", sep = ";",
                 header = TRUE, na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "figure/plot4.png", type = "quartz")
par(mfrow = c(2, 2))
with(df, {
        # plot 1
        plot(datetime, Global_active_power, type = "l",
             xlab = "", ylab = "Global Active Power")
        # plot 2
        plot(datetime, Voltage, type = "l")
        # plot 3
        plot(datetime, Sub_metering_1, type = "n",
             xlab = "", ylab = "Energy sub metering")
        lines(datetime, Sub_metering_1)
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.9,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        # plot 4
        plot(datetime, Global_reactive_power, type = "l")
})
dev.off()