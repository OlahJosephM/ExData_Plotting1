ElecPwrCnsmptn <- function () {
        
        ## read files
        #library(sqldf)
        #GAP <- read.csv2.sql("household_power_consumption.txt",
        #                      sql="SELECT * FROM file WHERE Date='2/1/2007' OR Date='2/2/2007'",
        #                      sep=";",na.strings="?" )
        
        ## Convert Date & Time variables
        # as.Date()
        dateTime <- paste(GAP$Date,GAP$Time,sep=' ')
        dateTime2 <- strptime(dateTime, "%m/%d/%Y %H:%M:%S")
        dfDateTime <- data.frame(dateTime2)
        subsetGAP <- GAP[,3:9]
        data <- data.frame(dfDateTime,subsetGAP)
        dataColNames <- c("DateTime", colnames(subsetGAP))
        data <- colnames(dataColNames)
        #goodData <- complete.cases(data)
        #data.good <- data[goodDataa,][1:sum(goodData),]
        
        ## Setup graphs
        #x11()
                
        ## Global Active Power Plot1:  Freq vs. Pwr
        png("plot1.png",width=480,height=480,units='px')
        with(data,hist(data$Global_active_power,col="orange"))
        dev.off()
        
                
        ## Plot 2: Pwr vs. Day
        #with(data,plot (DateTime,Global_active_power,    xlab="date",ylab="Global Active Power",    type="n"))
        #with(data,lines(DateTime,Global_active_power))
               
        ## Plot 3:  Sub Meter vs. Day
        #with(data, plot(DateTime,sub meter,    xlab="date",ylab="Sub meter",    type="n"))
        #with(data, {
        #        lines(DateTime, Sub_metering_1, col="black")
        #        lines(DateTime, Sub_metering_2, col="red"  )
        #        lines(DateTime, Sub_metering_3, col="blue" )
        #})
        #legend("topright", lty=1, col=c("black","red","blue"),
        #       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        #       box.col = "white",pt.cex=1)

        ## Plot 4: Quad chart
        #png("plot4.png",width=480,height=480,units='px')
        #par(mfrow=c(2,2))        
        
}