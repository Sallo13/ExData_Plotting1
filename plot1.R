plot1<- function(){
wholeTable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
dates<-strptime(wholeTable$Date,format = "%d/%m/%Y")
subset <- wholeTable[as.Date(dates)>=as.Date("2007-02-01") & as.Date(dates)<=as.Date("2007-02-02"),]
graph<-as.numeric(as.character(subset$Global_active_power))
hist(graph, col = "Red", xlab = "Global Active Power (killowatts)", main = "Global Active Power")
}