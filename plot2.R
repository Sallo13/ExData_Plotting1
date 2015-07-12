plot2<- function(){
  wholeTable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  dates<-strptime(wholeTable$Date,format = "%d/%m/%Y")
  subset <- wholeTable[as.Date(dates)>=as.Date("2007-02-01") & as.Date(dates)<=as.Date("2007-02-02"),]
  subset$DateTime<-strptime(paste(subset$Date, subset$Time," "),format = "%d/%m/%Y %H:%M:%S ")
  with(subset,plot(DateTime, Global_active_power,type="l", xlab="", ylab="Global Active Power (killowatts)"))
}