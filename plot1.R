datos=read.table("D:/curso_coursera/household_power_consumption.txt", sep=';', header=TRUE) %>%
  mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
  mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
  filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) %>%
  tbl_df

setwd("D:/curso_coursera/")
png(filename='plot1.png', width=480, height=480, units='px')
hist(as.numeric(datos$Global_active_power),col="red",main = "Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()