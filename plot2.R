#Load and prepare the Electric power consumption data.

#Read the file
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Restrict to the relevant dates 
power<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")

#Transform Time as a full Timestamp and cast Date as a date
power$Time<-strptime(paste(power$Date, power$Time),"%d/%m/%Y %H:%M:%S")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

#2 - Draw line
png("plot2.png")
plot(power$Time,power$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
