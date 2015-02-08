#
# Before running the script set the working directory to where the household_power_consumption.txt file is stored
# i.e. setwd("~/Documents/eda/project1")
# The script will generate a PNG file called "plot1.png" in the same directory
#

df<-read.csv(file = "household_power_consumption.txt", header = T, sep = ";", na.strings=c("?"))
df_sub <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
par(oma=c(1,1,1,1))
par(mar=c(4,4,1,2))
hist(df_sub$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red",
     breaks=seq(0,8, by=.5),
     axes=F)
axis(2, at=seq(0,1200, by=200))
axis(1, at=seq(0,6, by=2))

dev.copy(png, "plot1.png")
dev.off()
