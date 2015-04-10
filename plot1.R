### Exploratory Data Analysis
### Week 1 assignment

power <- read.table("./Module4-ExploratoryData/household_power_consumption.txt",sep=";")


power[,1] <- as.Date(power$V1 , "%d/%m/%Y")   ### changing the class of date column


### subsetting the data to only stipulated dates
powersubset <- subset(power, power$V1 == "2007-02-01" | power$V1 == "2007-02-02")


## renaming the columns
colnames(powersubset)<-c("Date", "Time", "Gloabl_active_power", "Global_reactive_power", 
                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


## changing the class of measures to numeric
powersubset[,3]<-as.numeric(levels(powersubset[,3]))[powersubset[,3]]


hist(powersubset[,3], xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")


dev.copy(png, file="plot1.png")    ### saving the file onto a png file
dev.off()                          ### closing the png device