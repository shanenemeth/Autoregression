install.packages("ggfortify")
install.packages("tseries")
install.packages("forecast")
library(ggfortify)
library(tseries)
library(forecast)
data("AirPassengers")
AP <- AirPassengers
AP
par(mar=c(1,1,1,1))
decomposeAP <- decompose(AP, "multiplicative")
autoplot(decomposeAP)
adf.test(AP)
arimaAP <- auto.arima(AP)
arimaAP
ggtsdiag(arimaAP)
forecastAP <- forecast(arimaAP, level = c(95), h=36)
autoplot(forecastAP)
