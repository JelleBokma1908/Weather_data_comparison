# OpenMeteo and VisualCrossing have - separated values, change to /
open_meteo$TimestampProcessed <- as.POSIXct(open_meteo$Timestamp, format = '%Y-%m-%d %H:%M')

visual_crossing$TimestampProcessed <- as.POSIXct(visual_crossing$Timestamp, format = '%Y-%m-%d %H:%M')

# The data sets that have / convert to date from string
MSP$TimestampProcessed <- as.POSIXct(MSP$Timestamp, format = '%d/%m/%Y %H:%M')

meteostat$TimestampProcessed <- as.POSIXct(meteostat$Timestamp, format = '%d/%m/%Y %H:%M')

weatherAPI$TimestampProcessed <- as.POSIXct(weatherAPI$Timestamp, format = '%d/%m/%Y %H:%M')

world_weather_online$TimestampProcessed <- as.POSIXct(world_weather_online$Timestamp, format = '%d/%m/%Y %H:%M')

#time series MSP vs hours - 13 TO 14
#instead of xlim a subset could be created to have an end/beginning of the plot. not very elegant this way but the data is continuous so scientifically justifiable
plot(MSP$TimestampProcessed, MSP$Temperature..C.,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Temperature (°C)", 
     main = "Observed Temperatures Between 13 January 16.00 and 14 January 16.00", 
     xaxt = "n",
     ylim = c(-10, 6),
     xlim = as.POSIXct(c("2025-01-13 16:00", "2025-01-14 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-13 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-13 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Temperature..C.,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Temperature..C.,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Temperature..C.,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Temperature..C.,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Temperature..C.,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

############ 14 TO 15
plot(MSP$TimestampProcessed, MSP$Temperature..C.,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Temperature (°C)", 
     main = "Observed Temperatures Between 14 January 16.00 and 15 January 16.00", 
     xaxt = "n",
     ylim = c(-10, 6),
     xlim = as.POSIXct(c("2025-01-14 16:00", "2025-01-15 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Temperature..C.,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Temperature..C.,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Temperature..C.,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Temperature..C.,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Temperature..C.,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

######### 15 TO 16
plot(MSP$TimestampProcessed, MSP$Temperature..C.,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Temperature (°C)", 
     main = "Observed Temperatures Between 15 January 16.00 and 16 January 16.00", 
     xaxt = "n",
     ylim = c(-10, 6),
     xlim = as.POSIXct(c("2025-01-15 16:00", "2025-01-16 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Temperature..C.,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Temperature..C.,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Temperature..C.,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Temperature..C.,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Temperature..C.,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

######## 16 to 17
plot(MSP$TimestampProcessed, MSP$Temperature..C.,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Temperature (°C)", 
     main = "Observed Temperatures Between 16 January 16.00 and 17 January 16.00", 
     xaxt = "n",
     ylim = c(-10, 6),
     xlim = as.POSIXct(c("2025-01-16 16:00", "2025-01-17 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-17 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-17 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Temperature..C.,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Temperature..C.,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Temperature..C.,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Temperature..C.,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Temperature..C.,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

###### FULL WEEK MONDAY TO FRIDAY
plot(MSP$TimestampProcessed, MSP$Temperature..C.,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Temperature (°C)", 
     main = "Observed Temperatures Between 13 January 16.00 and 17 January 14.00", 
     #xaxt = "n",
     ylim = c(-10, 6)
)

lines(meteostat$TimestampProcessed, meteostat$Temperature..C.,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Temperature..C.,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Temperature..C.,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Temperature..C.,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Temperature..C.,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

############################# HUMIDITY ####################################
#13 to 14
plot(MSP$TimestampProcessed, MSP$Humidity....,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Humidity (%)", 
     main = "Observed Relative Humidity Between 13 January 16.00 and 14 January 16.00", 
     xaxt = "n",
     ylim = c(40, 100),
     xlim = as.POSIXct(c("2025-01-13 16:00", "2025-01-14 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-13 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-13 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Humidity....,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Humidity....,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Humidity....,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Humidity....,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Humidity....,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

##### 14 to 15
plot(MSP$TimestampProcessed, MSP$Humidity....,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Humidity (%)", 
     main = "Observed Relative Humidity Between 14 January 16.00 and 15 January 16.00", 
     xaxt = "n",
     ylim = c(40, 100),
     xlim = as.POSIXct(c("2025-01-14 16:00", "2025-01-15 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-14 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Humidity....,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Humidity....,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Humidity....,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Humidity....,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Humidity....,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

######### 15 to 16
plot(MSP$TimestampProcessed, MSP$Humidity....,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Humidity (%)", 
     main = "Observed Relative Humidity Between 15 January 16.00 and 16 January 16.00", 
     xaxt = "n",
     ylim = c(40, 100),
     xlim = as.POSIXct(c("2025-01-15 16:00", "2025-01-16 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-15 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Humidity....,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Humidity....,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Humidity....,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Humidity....,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Humidity....,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

######## 16 to 17
plot(MSP$TimestampProcessed, MSP$Humidity....,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Humidity (%)", 
     main = "Observed Relative Humidity Between 16 January 16.00 and 17 January 16.00", 
     xaxt = "n",
     ylim = c(40, 100),
     xlim = as.POSIXct(c("2025-01-16 16:00", "2025-01-17 16:00"))
)


axis(1, at = seq(from = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                 to = as.POSIXct("2025-01-17 16:00", format = "%Y-%m-%d %H:%M"),
                 by = "3 hours"), 
     labels = format(seq(from = as.POSIXct("2025-01-16 16:00", format = "%Y-%m-%d %H:%M"),
                         to = as.POSIXct("2025-01-17 16:00", format = "%Y-%m-%d %H:%M"),
                         by = "3 hours"), "%H:%M"))


lines(meteostat$TimestampProcessed, meteostat$Humidity....,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Humidity....,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Humidity....,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Humidity....,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Humidity....,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

######## FULL WEEK MONDAY TO FRIDAY
plot(MSP$TimestampProcessed, MSP$Humidity....,
     type = "l",
     lwd = 2.5,
     pch = 16,
     col = "black",
     xlab = "Time",
     ylab = "Humidity (%)", 
     main = "Observed Relative Humidity Between 13 January 16.00 and 17 January 14.00", 
     #xaxt = "n",
     ylim = c(40, 100)
)

lines(meteostat$TimestampProcessed, meteostat$Humidity....,
      col = "darkblue",
      type = 'l',
      lty = 2,
      pch = 17)

lines(open_meteo$TimestampProcessed, open_meteo$Humidity....,
      col = "darkgreen",
      type = "l",
      lty = 2,
      pch = 16)

lines(visual_crossing$TimestampProcessed, visual_crossing$Humidity....,
      col = "darkorange",
      type = "l",
      lty = 2,
      pch = 16)

lines(weatherAPI$TimestampProcessed, weatherAPI$Humidity....,
      col = "purple",
      type = "l",
      lty = 2,
      pch = 16)

lines(world_weather_online$TimestampProcessed, world_weather_online$Humidity....,
      col = "darkred",
      type = "l",
      lty = 2,
      pch = 16)

############################### T-TEST FOR TEMPERATURE ##################

# t-test MSP vs Meteostat
meteostat_subset <- meteostat[2:96, ]
t_meteo <- t.test(MSP$Temperature..C., meteostat_subset$Temperature..C., 
                  paired = TRUE)
print(t_meteo)

# t-test MSP vs openmeteo
openmeteo_subset <- open_meteo[2:96, ]
t_openmeteo <- t.test(MSP$Temperature..C., openmeteo_subset$Temperature..C., 
                  paired = TRUE)
print(t_openmeteo)

# t-test MSP vs visualcrossing
visual_subset <- visual_crossing[2:96, ]
t_visual <- t.test(MSP$Temperature..C., visual_subset$Temperature..C., 
                      paired = TRUE)
print(t_visual)

# t-test MSP vs weatherAPI
wAPI_subset <- weatherAPI[2:96, ]
t_wAPI <- t.test(MSP$Temperature..C., wAPI_subset$Temperature..C., 
                   paired = TRUE)
print(t_wAPI) # NOT SIGNIFICANT

# t-test MSP vs worldweather
ww_subset <- world_weather_online[2:96, ]
t_ww <- t.test(MSP$Temperature..C., ww_subset$Temperature..C., 
                 paired = TRUE)
print(t_ww) # MARGINALLY NOT SIGNIFICANT


############################### T-TEST FOR HUMIDITY ##################

# t-test MSP vs Meteostat
meteostat_subset_h <- meteostat[2:96, ]
t_meteo_h <- t.test(MSP$Humidity...., meteostat_subset_h$Humidity...., 
                  paired = TRUE)
print(t_meteo_h)

# t-test MSP vs openmeteo
openmeteo_subset_h <- open_meteo[2:96, ]
t_openmeteo_h <- t.test(MSP$Humidity...., openmeteo_subset_h$Humidity...., 
                      paired = TRUE)
print(t_openmeteo_h) # marginally not significant

# t-test MSP vs visualcrossing
visual_subset_h <- visual_crossing[2:96, ]
t_visual_h <- t.test(MSP$Humidity...., visual_subset_h$Humidity...., 
                   paired = TRUE)
print(t_visual_h)

# t-test MSP vs weatherAPI
wAPI_subset_h <- weatherAPI[2:96, ]
t_wAPI_h <- t.test(MSP$Humidity...., wAPI_subset_h$Humidity...., 
                 paired = TRUE)
print(t_wAPI_h) # NOT SIGNIFICANT

# t-test MSP vs worldweather
ww_subset_h <- world_weather_online[2:96, ]
t_ww_h <- t.test(MSP$Humidity...., ww_subset_h$Humidity...., 
               paired = TRUE)
print(t_ww_h) # MARGINALLY SIGNIFICANT FOR ME AND NOT SIGNIFICANT FOR JELLE

########################### CORRELATION ######################
cor_meteo <- cor.test(MSP$Temperature..C., meteostat[2:96, ]$Temperature..C., method = "pearson")
cor_meteo

cor_wAPI <- cor.test(MSP$Temperature..C., weatherAPI[2:96, ]$Temperature..C., method = "pearson")
cor_wAPI

cor_wwo <- cor.test(MSP$Temperature..C., world_weather_online[2:96, ]$Temperature..C., method = "pearson")
cor_wwo

cor_openmeteo <- cor.test(MSP$Temperature..C., open_meteo[2:96, ]$Temperature..C., method = "pearson")
cor_openmeteo

cor_visual <- cor.test(MSP$Temperature..C., visual_crossing[2:96, ]$Temperature..C., method = "pearson")
cor_visual

#################### CORRELATION HUMIDITY ############################
cor_meteo_h <- cor.test(MSP$Humidity...., meteostat[2:96, ]$Humidity...., method = "pearson")
cor_meteo_h

cor_wAPI_h <- cor.test(MSP$Humidity...., weatherAPI[2:96, ]$Humidity...., method = "pearson")
cor_wAPI_h

cor_wwo_h <- cor.test(MSP$Humidity...., world_weather_online[2:96, ]$Humidity...., method = "pearson")
cor_wwo_h

cor_openmeteo_h <- cor.test(MSP$Humidity...., open_meteo[2:96, ]$Humidity...., method = "pearson")
cor_openmeteo_h

cor_visual_h <- cor.test(MSP$Humidity...., visual_crossing[2:96, ]$Humidity...., method = "pearson")
cor_visual_h
