#
# Code to reproduce Week 1, Assignment 1, Chart 4 for Exploratory Data Analysis Course
#
# Assignment information can be found in forked github repo here:  https://github.com/lrstang/ExData_Plotting1
#
# Note the PNG output legend is not properly rendered in RStudio (a feature).  Use regular R.
#

# read household power consumption data - '?' == NA
hpc<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")

# convert distinct date/time into datetime variable for ease of use
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

# subset data on dates specified in assignment instructions
hpcFiltered<-subset(hpc, DateTime > "2007-02-01" & DateTime < "2007-02-03")

# remove large, unneeded input dataframe
rm(hpc)

# set par() parameters - 2x2 chart grid, fill by row, white chart background
par(mfrow=c(2,2),bg="white")

# create line chart of Global Active Power variable w/appropriate axis labels
with (hpcFiltered, plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

# create line chart of Voltage variable w/appropriate axis labels
with (hpcFiltered, plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime"))

# create line chart of 3 sub-metering variables  w/legend
with (hpcFiltered, {
      plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",bg="white")
      points(DateTime, Sub_metering_2, type="l", col="red")
      points(DateTime, Sub_metering_3, type="l", col="blue")
      legend("topright", col=c("black","blue","red"), legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),lty=1,cex=0.9,bty="n")
      }
)

# create line chart of Global Reactive Power variable w/appropriate axis labels
with (hpcFiltered, plot(DateTime,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",ylim=c(0.0, 0.5)))


# create 480x480 pixel PNG output and close device
dev.copy(png,file="plot4.png")
dev.off()