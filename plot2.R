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


plot(x=power[,11], y=power[,3], type="l", ylab = "Global Active Power (Kilowatts)", xlab="")


dev.copy(png, file="plot2.png")    ### saving the file onto a png file
dev.off()                          ### closing the png device