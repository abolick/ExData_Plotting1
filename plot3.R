data <- read.table(file = "household_power_consumption.txt",  
                    sep = ";",  
                    skip = 66637, 
                    nrows = 2880, 
                    na.strings= "?") 

a <-  colnames(read.table("household_power_consumption.txt", sep = ";",nrow = 1, 
                          header = TRUE))  

# assign column names to data 
names(data) <- a 
str(data) 
date_time <- paste(data$Date,data$Time) 
day_of_the_week <- strptime(date_time, format ='%d/%m/%Y %H:%M:%S') 
str(day_of_the_week) 

#creates png file
png("plot3.png",width =480,height=480) 
plot(day_of_the_week,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering") 
lines(day_of_the_week,data$Sub_metering_2,col = "red") 
lines(day_of_the_week,data$Sub_metering_3,col= "blue") 
legend("topright", lty=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
dev.off() 
