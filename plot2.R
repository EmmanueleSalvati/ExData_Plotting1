df <- read.table(file = "dataset/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

## Combine the Date and Time into a single DateTime column
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

with(df, {
        plot(DateTime, Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power (kilowatts)",
             cex.lab = 0.75, cex.axis = 0.75)
        })

dev.copy(png, "figure/plot2.png")
dev.off()