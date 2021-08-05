datos=read.table("D:/curso_coursera/household_power_consumption.txt", sep=';', header=TRUE) %>%
  mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
  mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
  filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) %>%
  tbl_df

setwd("D:/curso_coursera/")

png(filename='plot4.png', width=480, height=480, units='px')

par(mfrow=c(2,2))

hist(as.numeric(datos$Global_active_power),col="red",main = "Global Active Power",xlab="Global Active Power (Kilowatts)")

plot(datos$Time,
     as.numeric(datos$Global_active_power),
     xlim=c(as.POSIXct(strftime("2007-02-01 00:00:00")), as.POSIXct(strftime("2007-02-03 00:00:00"))),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

axis.POSIXct(1,at=seq(as.POSIXct(strftime("2007-02-01 00:00:00")), as.POSIXct(strftime("2007-02-03 00:00:00")), by="day"), format="%a")


plot(datos$Time,
     datos$Sub_metering_1,
     xlim=c(as.POSIXct(strftime("2007-02-01 00:00:00")), as.POSIXct(strftime("2007-02-03 00:00:00"))),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Energy sub metering"
)

lines(datos$Time, datos$Sub_metering_2, col="red")
lines(datos$Time, datos$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(as.POSIXct(strftime("2007-02-01 00:00:00")), as.POSIXct(strftime("2007-02-03 00:00:00")), by="day"), format="%a")

legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))


plot(datos$Time,
     datos$Global_reactive_power,
     xlim=c(as.POSIXct(strftime("2007-02-01 00:00:00")), as.POSIXct(strftime("2007-02-03 00:00:00"))),
     xaxt="n",
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
)
axis.POSIXct(1, at=seq(as.POSIXct(strftime("2007-02-01 00:00:00")), as.POSIXct(strftime("2007-02-03 00:00:00")), by="day"), format="%a")

dev.off()
