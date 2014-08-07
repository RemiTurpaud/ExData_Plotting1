#Load and prepare the Electric power consumption data.

#Read the file
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Restrict to the relevant dates 
power<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")

#Transform Time as a full Timestamp and cast Date as a date
power$Time<-strptime(paste(power$Date, power$Time),"%d/%m/%Y %H:%M:%S")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")


#4 - 4 plots
png("plot4.png")
par(mfrow=c(2,2))
plot(power$Time,power$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(power$Time,power$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(power$Time,power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(power$Time,power$Sub_metering_2,col="red",type="l")
points(power$Time,power$Sub_metering_3,col="blue",type="l")
legend("topright", pch = "_", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")
with(power,plot(Time,Global_reactive_power,type="l",xlab="datetime"))
dev.off()