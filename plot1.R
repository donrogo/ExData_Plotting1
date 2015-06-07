#Reading the data in
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting the data
#sub <- subset(data, "1/2/2007", "2/2/2007")
sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Remove full data
rm(data)

#Converting subset to numeric
gap <- as.numeric(sub$Global_active_power)

#Making Plot
hist(gap, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     cex.lab=0.75, cex.main=0.75, cex.axis=0.75, font.main=2)

#Saving Plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()