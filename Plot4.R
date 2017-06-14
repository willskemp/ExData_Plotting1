# Load 'lattice' package
require(lattice)

# Set working directory to file location
setwd("C:/Users/william.kemp/Desktop/Data Science - John Hopkins/4. Exploratory Data Analysis/Week 1 Peer Review/Dataset")

# Read in the data file with ";" separator
plotdata <-  read.table("household_power_consumption.txt",sep=";",header =T,
                        na.strings ="?")

# Convert date and time data to "POSIXct" format. Create new merged DateTime variable. 
plotdata$DateTime <- with(plotdata,as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
plotdata$Date <- as.Date(plotdata$Date,format ="%d/%m/%Y")
plotdata$Time <- strptime(plotdata$Time,format="%H:%M:%S")


# Create new dataset called 'subdata'
#This will consists of plotdata filtered to the data range 2007-02-01 and 2007-02-02
subdata <- subset(plotdata,Date>="2007-02-01" & Date <="2007-02-02")


# Plot 4
png(filename ="Plot4.png", height = 480,width =480)

par(mfrow=c(2,2))
plot(subdata$DateTime,subdata$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts")

plot(subdata$DateTime,subdata$Voltage,type="l",
     xlab="datetime",ylab="Voltage")

plot(subdata$DateTime,subdata$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub metering")
lines(subdata$DateTime,subdata$Sub_metering_2,col = 2)
lines(subdata$DateTime,subdata$Sub_metering_3,col = 4)
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),
        lwd = c(0.5,0.5,0.5),col= c(1,2,4),cex=0.75)

plot(subdata$DateTime,subdata$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")

dev.off()