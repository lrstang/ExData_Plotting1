#
# Code to reproduce Week 1, Assignment 1, Chart 2 for Exploratory Data Analysis Course
#
# Assignment information can be found in forked github repo here:  https://github.com/lrstang/ExData_Plotting1
#
#

# read household power consumption data - '?' == NA
hpc<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")

# convert distinct date/time into datetime variable for ease of use
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

# subset data on dates specified in assignment instructions
hpcFiltered<-subset(hpc, DateTime > "2007-02-01" & DateTime < "2007-02-03")

# remove large, unneeded input dataframe
rm(hpc)

# create line chart of Global Active Power variable w/appropriate axis labels
with (hpcFiltered, plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

# create 480x480 pixel PNG output and close device
dev.copy(png,file="plot2.png")
dev.off()