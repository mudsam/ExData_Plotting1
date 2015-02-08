#
# Before running the script set the working directory to where the household_power_consumption.txt file is stored
# i.e. setwd("~/Documents/eda/project1")
# The script will generate a PNG file called "plot3.png" in the same directory
#

df<-read.csv(file = "household_power_consumption.txt",
             header = T,
             sep = ";",
             na.strings=c("?"),
             stringsAsFactors=F)
df_sub <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df_sub$ts<-strptime(sprintf("%s %s", df_sub$Date, df_sub$Time), "%d/%m/%Y %H:%M:%S")

par(oma=c(2,1,2,1))
par(mar=c(2,4,1,1))
plot(df_sub$ts,
     df_sub$Sub_metering_1,
     type="n",
     main="",
     ylab="Energy sub metering",
     xlab="",
     ylim=c(0,40),
     axes=F)
lines(df_sub$ts, df_sub$Sub_metering_1, col="black")
lines(df_sub$ts, df_sub$Sub_metering_2, col="red")
lines(df_sub$ts, df_sub$Sub_metering_3, col="blue")
axis(2, at=seq(0,30,by=10))
axis.POSIXct(1, df_sub$ts)
legend(x="topright",
       y.intersp = 1,
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"))
box(lty="solid")

dev.copy(png, "plot3.png")
dev.off()