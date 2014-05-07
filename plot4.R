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

filename = "plot4.png";
cexFactor <- 1.0;
labelAts <- c(min(dataSubSet$DateTime), mean(dataSubSet$DateTime) + 30, max(dataSubSet$DateTime) + 60);

png(
  filename = filename,
  width = 480, height = 480, units = "px"
)

par(mfrow=c(2,2))

#plot 1
plot(
  dataSubSet$DateTime,
  dataSubSet$Global_active_power,
  type = "l",
  col = "black",
  main = "",
  xlab="", 
  ylab="Global Active Power",
  xaxt="n",
  cex = cexFactor,
  cex.axis = cexFactor,
  cex.lab = cexFactor,
  cex.main = cexFactor
);
axis(1, 
   at = as.double(labelAts), 
   labels = format(labelAts, "%a"),
   cex = cexFactor,
   cex.axis = cexFactor,
   cex.lab = cexFactor,
   cex.main = cexFactor  
);

#plot 2
plot(
  dataSubSet$DateTime,
  dataSubSet$Voltage,
  type = "l",
  col = "black",
  main = "",
  xlab="datetime", 
  ylab="Voltage",
  xaxt="n",
  cex = cexFactor,
  cex.axis = cexFactor,
  cex.lab = cexFactor,
  cex.main = cexFactor
);
axis(1, 
   at = as.double(labelAts), 
   labels = format(labelAts, "%a"),
   cex = cexFactor,
   cex.axis = cexFactor,
   cex.lab = cexFactor,
   cex.main = cexFactor  
);

#plot 3
plot(
  dataSubSet$DateTime,
  dataSubSet$Sub_metering_1,
  type = "l",
  col = "black",
  main = "",
  xlab="", 
  ylab="Energy sub metering",
  xaxt="n",
  cex = cexFactor,
  cex.axis = cexFactor,
  cex.lab = cexFactor,
  cex.main = cexFactor
);

lines( dataSubSet$DateTime, dataSubSet$Sub_metering_2, type="l", col="red")
lines( dataSubSet$DateTime, dataSubSet$Sub_metering_3, type="l", col="blue")
legend (
  "topright", 
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty=c(1,1),
  cex = cexFactor,
  bty = "n"
)
axis(1, 
     at = as.double(labelAts), 
     labels = format(labelAts, "%a"),
     cex = cexFactor,
     cex.axis = cexFactor,
     cex.lab = cexFactor,
     cex.main = cexFactor  
);

#plot 4
plot(
  dataSubSet$DateTime,
  dataSubSet$Global_reactive_power,
  type = "l",
  col = "black",
  main = "",
  xlab="datetime", 
  ylab="Global_reactive_power",
  xaxt="n",
  cex = cexFactor,
  cex.axis = cexFactor,
  cex.lab = cexFactor,
  cex.main = cexFactor
);
axis(1, 
     at = as.double(labelAts), 
     labels = format(labelAts, "%a"),
     cex = cexFactor,
     cex.axis = cexFactor,
     cex.lab = cexFactor,
     cex.main = cexFactor  
);
dev.off()