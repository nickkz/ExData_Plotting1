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

filename = "plot2.png";

png(
  filename = filename,
  width = 480, height = 480, units = "px"
)

cexFactor <- 1;

plot(
  dataSubSet$DateTime,
  dataSubSet$Global_active_power,
  type = "l",
  col = "black",
  main = "",
  xlab="", 
  ylab="Global Active Power (kilowatts)",
  xaxt="n",
  cex = cexFactor,
  cex.axis = cexFactor,
  cex.lab = cexFactor,
  cex.main = cexFactor
);

labelAts <- c(min(dataSubSet$DateTime), mean(dataSubSet$DateTime) + 30, max(dataSubSet$DateTime) + 60);

axis(1, 
  at = as.double(labelAts), 
  labels = format(labelAts, "%a"),
  cex = cexFactor,
  cex.axis = cexFactor,
  cex.lab = cexFactor,
  cex.main = cexFactor  
);


dev.off()