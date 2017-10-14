#
# Code to reproduce Week 1, Assignment 1, Chart 1 for Exploratory Data Analysis Course
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

# create histogram with red frequency bars and appropriate titles and axis labels
hist(hpcFiltered$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))

# create 480x480 pixel PNG output and close device
dev.copy(png,file="plot1.png")
dev.off()