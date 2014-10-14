plot4 <- function () {
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
                
        ## Plot 4: Quad chart
        png("plot4.png",width=480,height=480,units='px')
        par(mfrow=c(2,2))
        par(pch=".")
        
        with(data, {
                # Global Active Power
                plot (DateTime, Global_active_power)
                lines(DateTime, Global_active_power)
                
                # Voltage
                plot (DateTime, Voltage)
                lines(DateTime, Voltage)
                
                # Energy sub metering
                plot  (DateTime, Sub_metering_3)
                lines (DateTime, Sub_metering_3, col="blue" )
                points(DateTime, Sub_metering_1)
                lines (DateTime, Sub_metering_1, col="black")
                points(DateTime, Sub_metering_2)
                lines (DateTime, Sub_metering_2, col="red"  )
                
                # Global_reactive_power
                plot (DateTime, Global_reactive_power)
                lines(DateTime, Global_reactive_power)
                
                mtext("title", outer=TRUE)
        })
        
        dev.off()
}