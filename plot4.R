plot4<- function(){
  wholeTable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  dates<-strptime(wholeTable$Date,format = "%d/%m/%Y")
  subset <- wholeTable[as.Date(dates)>=as.Date("2007-02-01") & as.Date(dates)<=as.Date("2007-02-02"),]
  subset$DateTime<-strptime(paste(subset$Date, subset$Time," "),format = "%d/%m/%Y %H:%M:%S ")
  par(mfrow=c(2,2))
  with(subset,plot(DateTime, Global_active_power,type="l", xlab="", ylab="Global Active Power"))
  with(subset,plot(DateTime, Voltage,type="l", xlab="datetime", ylab="Voltage"))
  with(subset,plot(DateTime, Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
  lines(subset$DateTime,subset$Sub_metering_2, type = "l", col = "Red")
  lines(subset$DateTime,subset$Sub_metering_3, type = "l", col = "Blue")
  legend("topright",5.5,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","blue","red"), cex=0.4, bty="n")
  with(subset,plot(DateTime, Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power"))
}