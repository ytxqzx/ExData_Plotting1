## load data and choose subset for date equals to "2007-2-1" or "2007-2-2"

data <- read.csv("household_power_consumption.txt" ,sep = ";",header= TRUE,stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
dt <- subset(data, data$Date=="2007-2-1"|data$Date =="2007-2-2")  
dt[,3:8] <- sapply(dt[3:8],as.numeric)


## Convert secdend column from Charater to Date format
for (i in 1:2880) {
      dt[i,2] = paste(dt[i,1],dt[i, 2])
}
dt$Time <- as.POSIXct(dt$Time)



## First Plot hist(Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(dt$Global_active_power,col="red",main = "Global Active Power", 
     xlab = "Global Active Power (killowatts)")
dev.off()

## plot2
png("plot2.png", width = 480, height = 480)
plot(dt$Time, dt$Global_active_power , type = "l",
     xlab = " ",ylab = "Global Active Power (killowatts)")
dev.off()

## Plot3
png("plot3.png", width = 480, height = 480)
with(dt, plot(Time, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
with(dt, lines(Time, Sub_metering_2, col = "red", type = "l", xlab = "",ylab = NULL))
with(dt, lines(Time, Sub_metering_3, col = "blue", type = "l", xlab = "",ylab = NULL))
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()



## Plot4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(dt,{
      plot(Time, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
      plot(Time, Voltage, type = "l", xlab= "datetime")
      plot(Time, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_2, col = "red", type = "l", xlab = "",ylab = NULL)
      lines(Time, Sub_metering_3, col = "blue", type = "l", xlab = "",ylab = NULL)
      legend("topright", lwd = 1, , bty = "n", col = c("black", "red", "blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Time, Global_reactive_power, xlab= "datetime",type = "l")
})
dev.off()


