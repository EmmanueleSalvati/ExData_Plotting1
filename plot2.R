df <- read.table(file = "dataset/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
with(df, {plot(Time, Global_active_power)})

## I think I need to use the datetime functions to combine the Date and Time
## columns