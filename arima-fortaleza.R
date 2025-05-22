# install.packages('forecast')
# install.packages('fpp2')

# Importação das bibliotecas necessárias
library(forecast)
library(fpp2)

# Importação do dataset
setwd('C:/Desenvolvimento/dengue-arima-fortaleza')
df <- read.csv('fortaleza.csv')[,c('y')]
df <- ts(df, start = c(2014, 1), end = c(2024, 52), frequency = 52)
df

# Observando a série temporal
autoplot(df, xlab = 'Tempo', ylab = 'Casos')

# Obtenção dos melhores parâmetros com auto-arima
auto.arima(df, trace = TRUE, approximation = FALSE)

# Implementação do modelo Arima encontrado anteriormente
model <- Arima(df, order = c(1,0,4), seasonal = c(0,0,1))
saveRDS(model, file = "modelo.rds")

# Conferir a qualidade do modelo
checkresiduals(model)

# Previsão para o ano de 2025
previsao <- forecast(model, h = 52)
autoplot(previsao, xlab = 'Tempo', ylab = 'Casos')

previsao
write.csv(previsao, file = "predicao.csv", row.names = FALSE)
