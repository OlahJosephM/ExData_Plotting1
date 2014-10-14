plot3 <- function () {
        ## This function assumes X11 for plotting.
        
        ## read files
        library(sqldf)
        
        GAP <- read.csv2.sql("household_power_consumption.txt",
                              sql="SELECT * FROM file WHERE Date='2/1/2007' OR Date='2/2/2007'",
                              sep=";",na.strings="?" )
        
        ## Convert Date & Time variables
        dateTime <- paste(GAP$Date,GAP$Time,sep=' ')
        dateTime2 <- strptime(dateTime, "%m/%d/%Y %H:%M:%S")
        dfDateTime <- data.frame(dateTime2)
        subsetGAP <- GAP[,3:9]
        data <- data.frame(dfDateTime,subsetGAP)
        dataColNames <- c("DateTime", colnames(subsetGAP))
        colnames(data) <- dataColNames
        
        ## Setup graph
        x11()

        ## Plot 3:  Sub Meter vs. Day
        png("plot3.png",width=480,height=480,units='px')
        par(pch=".")
        with(data, plot  (DateTime, Sub_metering_3,
                        xlab="",
                        ylab="Energy sub metering",
                        type="n"))
        with(data, points(DateTime, Sub_metering_1))
        with(data, points(DateTime, Sub_metering_2))
        
        with(data, lines(DateTime, Sub_metering_1, col="black"))
        with(data, lines(DateTime, Sub_metering_2, col="red"  ))
        with(data, lines(DateTime, Sub_metering_3, col="blue" ))
        
        legend("topright", lty=1, col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               box.col="white", pt.cex=1)
        
        dev.off()
}