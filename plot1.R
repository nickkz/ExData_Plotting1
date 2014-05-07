setwd("Q:\\coursera\\exp_data\\ExData_Plotting1");
data <- read.table(
  "../data/household_power_consumption.txt", 
  header = TRUE,
  sep = ";",
  colClasses = c(
    "character", "character", rep("numeric",7)),
  na.strings=c("?")
  );

data$DateDate <- as.Date(data$Date, format="%d/%m/%Y");
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");
dataSubSet <- subset (
  data, 
  DateDate >= as.Date("2007-02-01") & 
    DateDate <= as.Date("2007-02-02")
);

filename = "plot1.png";
png(
  filename = filename,
  width = 480, height = 480, units = "px"
)

hist(
  dataSubSet$Global_active_power,
  breaks=12,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
);

dev.off()