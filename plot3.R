### Exploratory Data Analysis
### Week 1 assignment

power <- read.table("./Module4-ExploratoryData/household_power_consumption.txt",sep=";")
power$DateTime = paste(power$V1, power$V2)
power$DateTimeProper = strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

power[,1] <- as.Date(power$V1 , "%d/%m/%Y")


  ### subsetting the data to only stipulated dates
power <- subset(power, power$V1 == "2007-02-01" | power$V1 == "2007-02-02")

  ## renaming the columns
colnames(power)<-c("Date", "Time", "Gloabl_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "DateTime", "DateTimeProper")

    ## changing the class of measures to numeric
power[,3]<-as.numeric(levels(power[,3]))[power[,3]]

    ## changing the class of sub_metering to numeric
power[,7]<-as.numeric(levels(power[,7]))[power[,7]]
power[,8]<-as.numeric(levels(power[,8]))[power[,8]]
power[,9]<-as.numeric(levels(power[,9]))[power[,9]]

   ## plotting the charts
plot(x=power[,11], y=power[,7], type="l", ylab = "Energy sub metering", xlab = "")
lines(x=power[,11], y=power[,8],col="red")
lines(x=power[,11], y=power[,9],col="blue")
legend("topright",  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

dev.copy(png, file="plot3.png")    ### saving the file onto a png file
dev.off()                          ### closing the png device