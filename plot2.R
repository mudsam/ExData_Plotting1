#
# Before running the script set the working directory to where the household_power_consumption.txt file is stored
# i.e. setwd("~/Documents/eda/project1")
# The script will generate a PNG file called "plot2.png" in the same directory
#

##
## Ingest and prepare data
##

# Read file from disk
df<-read.csv(file = "household_power_consumption.txt",
             header = T,
             sep = ";",
             na.strings=c("?"),
             stringsAsFactors=F)

# Create new dataframe that conains Feb-1-2007 and Feb-2-2007
df_sub <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Add timestamp column by combining and parsing the Date and Time columns
df_sub$ts<-strptime(sprintf("%s %s", df_sub$Date, df_sub$Time), "%d/%m/%Y %H:%M:%S")

##
## Setup plot parameters
##

# Set outer margins
par(oma=c(2,1,2,1))

# Set margins
par(mar=c(2,4,1,1))

##
## Plot
##

# Create plot but do not display it (type="n") and do not include axes (axes=F)
plot(df_sub$ts,
     df_sub$Global_active_power,
     type="n",
     main="",
     ylab="Global Active Power (kwatts)",
     xlab="",
     ylim=c(0,7.5),
     axes=F)

# Add line plot
lines(df_sub$ts, df_sub$Global_active_power)

# Add axes
axis(2, at=seq(0,6,by=2))
axis.POSIXct(1, df_sub$ts)

# Add box around the plot
box(lty="solid")

##
## Store plot in PNG file
##

# Create PNG file by copying the existing device
dev.copy(png, "plot2.png")
dev.off()
