#
# Code to reproduce Week 1, Assignment 1, Chart 3 for Exploratory Data Analysis Course
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

# create line chart of 3 sub-metering variables  w/legend
with (hpcFiltered, {
      plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
      points(DateTime, Sub_metering_2, type="l", col="red")
      points(DateTime, Sub_metering_3, type="l", col="blue")
      legend("topright", col=c("black","blue","red"), legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),lty=1,cex=0.9)
      }
)

# create 480x480 pixel PNG output and close device
dev.copy(png,file="plot3.png")
dev.off()