electric<- read.table("household_power_consumption.txt",sep=";")
colnames(electric)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dateTime<-paste(electric$Date,electric$Time,sep=" ")
dateTime<-as.POSIXct(strptime(dateTime,"%d/%m/%Y %H:%M:%S"))
electric$DateTime<-dateTime
electricNew<-subset(electric,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<as.POSIXct("2007-02-03 00:00:00"))
x<-as.numeric(as.character(electricNew$Global_active_power))
electricNew$Global_active_power<-x
plot(electricNew$DateTime,electricNew$Global_active_power,type="l",ylab="Global Active Power",xlab="")
dev.copy(png,file="plot2.png")
dev.off()

