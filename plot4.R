rawdata <- read.csv("c:\\homework\\household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataset, {plot(Global_active_power~Datetime, type="l",ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power")
})

