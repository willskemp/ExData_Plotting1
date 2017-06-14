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

# Plot 1
png(filename = "Plot1.png", height = 480,width =480)
hist(subdata$Global_active_power,freq = T,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")
dev.off()