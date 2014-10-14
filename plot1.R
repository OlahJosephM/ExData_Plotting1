plot1 <- function () {
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
                
        ## Global Active Power Plot1:  Freq vs. Pwr
        png("plot1.png",width=480,height=480,units='px')
        with(data,hist(data$Global_active_power,col="orange"))
        
        dev.off()
}