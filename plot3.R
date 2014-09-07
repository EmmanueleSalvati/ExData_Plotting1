df <- read.table(file = "dataset//household_power_consumption.txt", sep = ";",
                 header = TRUE, na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

## Combine the Date and Time into a single DateTime column
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

## If I used dev.copy, it was going to mess up the label size,
## hence I use png, instead.
png(filename = "figure/plot3.png", type = "quartz")

## Empty plot with correct axes and styles
with(df, {
        plot(DateTime, Sub_metering_1, type = "n",
             xlab = "", ylab = "Energy sub metering")
})

## Fill the plot
with(df, {lines(DateTime, Sub_metering_1)})
with(df, {lines(DateTime, Sub_metering_2, col = "red")})
with(df, {lines(DateTime, Sub_metering_3, col = "blue")})
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()