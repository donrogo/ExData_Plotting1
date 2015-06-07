#Reading data
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#Subsetting data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

#Converting time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Changing language to English so that you get Friday etc. instead
#of eg. Freitag (German) when on Language Setting is German
backkup_locale <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')

#Making the plot
plot(data$Sub_metering_1~data$Datetime, type="l",
     ylab="Energy sub metering", xlab="", cex.axis=0.75, cex.lab=0.75)
lines(data$Sub_metering_2~data$Datetime, col="red")
lines(data$Sub_metering_3~data$Datetime, col="blue")
 
#Adding the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.6)
#Saving the plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

#Set back to local language
Sys.setlocale('LC_TIME', backkup_locale)