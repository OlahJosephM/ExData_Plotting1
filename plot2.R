plot2 <- function () {
        ## Function assumes X11 for plotting.
        
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
                
        ## Plot 2: Pwr vs. Day
        png("plot2.png",width=480,height=480,units='px')
        with(data,plot (DateTime,Global_active_power,
                        xlab="date",
                        ylab="Global Active Power",
                        type="n"))
        with(data,lines(DateTime,Global_active_power))
        
        dev.off()
}