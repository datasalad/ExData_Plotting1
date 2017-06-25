## Initial setings
datafile <- "household_power_consumption.txt"
currentDir <- getwd()
datasetLocation <- file.path(currentDir, datafile)

## Load required libraries
library(dplyr)
library(lubridate)

## Step 1. Load the data into R
## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
fileConnection <- file(datasetLocation)
filter <- grep("^[1,2]/2/2007", readLines(fileConnection), value = TRUE)

dataset <- read.table(
    text = filter,
    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

close(fileConnection)

## str(dataset)
## 'data.frame':	2879 obs. of  9 variables:
# $ Date                 : chr  "1/2/2007" "1/2/2007" "1/2/2007" "1/2/2007" ...
# $ Time                 : chr  "00:01:00" "00:02:00" "00:03:00" "00:04:00" ...
# $ Global_active_power  : num  0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 0.226 ...
# $ Global_reactive_power: num  0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 0 ...
# $ Voltage              : num  243 244 244 243 242 ...
# $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 1 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

## Step 2. Build the first plot. Source R file 'plot1.R' for that and call a function 'constructPlot1'
source("plot1.R")
constructPlot1(dataset)

## Step 2. Build the second plot. Source R file 'plot2.R' for that and call a function 'constructPlot2'
## We'll also add a temporary column to the dateset which will containt Date in a convenient format

dataset <- mutate(dataset, DateConverted = dmy_hms(paste(Date, Time)))

source("plot2.R")
constructPlot2(dataset)

## Step 3. Build the third plot. Source R file 'plot3.R' for that and call a function 'constructPlot3'
source("plot3.R")
constructPlot3(dataset)

## Step 4. Build the last plot. Source R file 'plot4.R' for that and call a function 'constructPlot4'
source("plot4.R")
constructPlot4(dataset)