df <- read.table(file = "dataset/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.copy(png, "figure/plot1.png")
dev.off()