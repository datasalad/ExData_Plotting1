constructPlot3 <- function(dataset) {
    png("plot3.png", width = 480, height = 480)
    with(dataset, 
         {
            plot(Sub_metering_1 ~ DateConverted, type = "l",  ylab = "Energy sub metering", xlab = "")
            lines(Sub_metering_2 ~ DateConverted, col = "red")
            lines(Sub_metering_3 ~ DateConverted, col = "blue")
        })
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}