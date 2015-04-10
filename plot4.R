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
power[,4]<-as.numeric(levels(power[,4]))[power[,4]]
power[,5]<-as.numeric(levels(power[,5]))[power[,5]]


    ## changing the class of sub_metering to numeric
power[,7]<-as.numeric(levels(power[,7]))[power[,7]]
power[,8]<-as.numeric(levels(power[,8]))[power[,8]]
power[,9]<-as.numeric(levels(power[,9]))[power[,9]]

   
par(mfrow=c(2,2))
with(power,{
  plot(x=power[,11], y=power[,3], type="l", ylab = "Global Active Power (Kilowatts)", xlab="")
  plot(x=power[,11], y=power[,5], type="l", ylab = "Voltage", xlab="datetime")
  plot(x=power[,11], y=power[,7], type="l", ylab = "Energy sub metering", xlab="")
    lines(x=power[,11], y=power[,8],col="red")
    lines(x=power[,11], y=power[,9],col="blue")
    legend("topright",  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd=c(1,1,1),col=c("black","red","blue"), cex=0.7) ## Cex helps to adjust the size of the legend   
  plot(x=power[,11], y=power[,4], type="l", ylab = "Global_reactive_power", xlab="datetime")
})
    

dev.copy(png, file="plot4.png")    ### saving the file onto a png file
dev.off()                          ### closing the png device