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
