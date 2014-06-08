## Making plot3.png for Course Project 1
## for Exploratory Data Analysis
plot3 <- function() {
  headset <- read.csv("household_power_consumption.txt", header=TRUE, nrows=10, sep=";", na.strings="?")
  ## Reading data mostly containg rows from interested dates
  data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", skip=60000, nrows=10000, colClasses=sapply(headset, class), col.names=names(headset))
  ## Subsetting dates
  data <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007"))
  ## Converting dates and times to correct data types
  data$Date = as.Date(data$Date, format="%d/%m/%Y")
  data$Time = format(strptime(data$Time, format="%T"), "%H:%M:%S")
  row.names(data) <- 1:length(data$Date)
  ## Making vector of date/times of actual measurements
  d <- strptime(paste(s$Time, as.character(s$Date), " "), format="%T %Y-%m-%d")
  ## Plotting file plot3.png
  png(file="plot3.png", bg="transparent")
  ## Making a blank plot accounting Sub_metering_1 since it is largest one
  plot(d, s$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  ## Plotting three lines
  lines(d, s$Sub_metering_1, col="black")
  lines(d, s$Sub_metering_2, col="red")
  lines(d, s$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1), lwd=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  data
}