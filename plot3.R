electric<- read.table("household_power_consumption.txt",sep=";")
colnames(electric)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dateTime<-paste(electric$Date,electric$Time,sep=" ")
dateTime<-as.POSIXct(strptime(dateTime,"%d/%m/%Y %H:%M:%S"))
electric$DateTime<-dateTime
electricNew<-subset(electric,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<as.POSIXct("2007-02-03 00:00:00"))

sm1<-as.numeric(as.character(electricNew$Sub_metering_1))
 sm2<-as.numeric(as.character(electricNew$Sub_metering_2))
 sm3<-as.numeric(as.character(electricNew$Sub_metering_3))
plot(electricNew$DateTime,sm1,type="l",xlab="",ylab="Energy sub metering")
lines(electricNew$DateTime,sm2,col="red")
 lines(electricNew$DateTime,sm3,col="blue")
dev.copy(png,file="plot3.png")
dev.off()