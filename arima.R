# Importação do dataset
setwd('C:/Desenvolvimento/dengue-arima-fortaleza')
sarima <- read.csv('dataset/previsoes_sarima.csv')
lstm <- read.csv('dataset/previsoes_lstm.csv')

length(sarima$Point.Forecast)
length(lstm$Previsão)

lines(sarima$Point.Forecast)
plot(lstm$Previsão)
