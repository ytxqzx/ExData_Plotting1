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


## Plot3
png("plot3.png", width = 480, height = 480)
with(dt, plot(Time, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
with(dt, lines(Time, Sub_metering_2, col = "red", type = "l", xlab = "",ylab = NULL))
with(dt, lines(Time, Sub_metering_3, col = "blue", type = "l", xlab = "",ylab = NULL))
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
