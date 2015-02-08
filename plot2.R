#
# Before running the script set the working directory to where the household_power_consumption.txt file is stored
# i.e. setwd("~/Documents/eda/project1")
# The script will generate a PNG file called "plot2.png" in the same directory
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
     df_sub$Global_active_power,
     type="n",
     main="",
     ylab="Global Active Power (kwatts)",
     xlab="",
     ylim=c(0,7.5),
     axes=F)
lines(df_sub$ts, df_sub$Global_active_power)
axis(2, at=seq(0,6,by=2))
axis.POSIXct(1, df_sub$ts)
box(lty="solid")

dev.copy(png, "plot2.png")
dev.off()
