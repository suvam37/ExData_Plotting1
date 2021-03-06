electric<- read.table("household_power_consumption.txt",sep=";")
colnames(electric)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dateTime<-paste(electric$Date,electric$Time,sep=" ")
dateTime<-as.POSIXct(strptime(dateTime,"%d/%m/%Y %H:%M:%S"))
electric$DateTime<-dateTime
electricNew<-subset(electric,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<as.POSIXct("2007-02-03 00:00:00"))
x<-as.numeric(as.character(electricNew$Global_active_power))
electricNew$Global_active_power<-x
electricNew$Global_reactive_power<-as.numeric(as.character(electricNew$Global_reactive_power))
electricNew$Voltage<-as.numeric(as.character(electricNew$Voltage))
par(mfrow=c(2,2))
plot(electricNew$DateTime,electricNew$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(electricNew$DateTime,electricNew$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(electricNew$DateTime,sm1,type="l",xlab="",ylab="Energy sub metering")
 lines(electricNew$DateTime,sm2,col="red")
 lines(electricNew$DateTime,sm3,col="blue")
plot(electricNew$DateTime,electricNew$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
 dev.copy(png,file="plot4.png")
dev.off()
