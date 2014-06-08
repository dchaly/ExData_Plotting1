## Making plot3.png for Course Project 1
## for Exploratory Data Analysis
plot4 <- function() {
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
  ## Plotting file plot4.png
 png(file="plot4.png", bg="transparent")
 par(mfrow=c(2,2)) ## two rows and two columns in the plot

  ## Top-left plot
  plot(d, s$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(d, s$Global_active_power)

  ## Top-right plot
  plot(d, s$Voltage, type="n", xlab="datetime", ylab="Voltage")
  lines(d, s$Voltage)

  ## Bottom-left plot (copied code from plot3.R plus tweaked a legend
  plot(d, s$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(d, s$Sub_metering_1, col="black")
  lines(d, s$Sub_metering_2, col="red")
  lines(d, s$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1), bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Bottom-right plot
  plot(d, s$Global_reactive_power, type="n", xlab="datetime")
  lines(d, s$Global_reactive_power)

  dev.off()
  data
}