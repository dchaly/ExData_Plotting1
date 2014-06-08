## Making plot1.png for Course Project 1
## for Exploratory Data Analysis
plot1 <- function() {
  headset <- read.csv("household_power_consumption.txt", header=TRUE, nrows=10, sep=";", na.strings="?")
  ## Reading data mostly containg rows from interested dates
  data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", skip=60000, nrows=10000, colClasses=sapply(headset, class), col.names=names(headset))
  ## Subsetting dates
  data <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007"))
  ## Converting dates and times to correct data types
  data$Date = as.Date(data$Date, format="%d/%m/%Y")
  data$Time = format(strptime(data$Time, format="%T"), "%H:%M:%S")
  row.names(data) <- 1:length(data$Date)
  ## Plotting file plot1.png
  png(file="plot1.png", bg="transparent")
  with(data, hist(Global_active_power, main="Global Active Power", ylim=c(0,1200), col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
  dev.off()
  data
}