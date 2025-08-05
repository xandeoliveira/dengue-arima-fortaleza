# install.packages('forecast')
# install.packages('fpp2')
# install.packages('Metrics')

# Importação das bibliotecas necessárias
library(forecast)
library(fpp2)

# Importação do dataset
setwd('C:/Desenvolvimento/dengue-arima-fortaleza')
df <- read.csv('dataset/201401-202526.csv')[,c('casos')]
df <- ts(df, start = c(2014, 1), end = c(2025, 26), frequency = 52)

# Observando a série temporal
autoplot(df, xlab = 'Tempo', ylab = 'Casos')

# Série Transformada (log)
df_log <- log(df)
autoplot(df_log, xlab = 'Tempo', ylab = 'log(casos)')

qqnorm(df_log)
qqline(df_log)

# Treino e teste
train <- window(df_log, end = c(2024, 52))
test <- window(df, start = c(2025, 1)) # usado nas métricas

plot(train)
lines(test, col = 'blue')

# Identificação de Treino e Validação
plot(df_log)
lines(train, col = 'blue')
legend("topright",                          # Posição da legenda
       legend = c("202501-202526", "201401-202452"),  # Rótulos
       col = c('black','blue'),             # Cores correspondentes
       lty = 1,                             # Tipo de linha
       cex = 0.5) 

# ACF e PACF
par(mfrow=c(1,2))
acf(train)
pacf(train)

# Obtenção dos melhores parâmetros com auto-arima
auto.arima(train, trace = TRUE, approximation = FALSE)

# Implementação do modelo Arima encontrado anteriormente
model <- Arima(train, order = c(0,1,0), seasonal = c(2,1,0))
saveRDS(model, file = "modelo/modelo(0,1,0)(2,1,0).rds")

# Conferir a qualidade do modelo
checkresiduals(model)

# Previsão para o ano de 2025
previsao <- forecast(model, h = 52)
par(mfrow=c(1,1))

plot(previsao)
lines(df_log, col = 'blue')
lines(train, col = 'black')
legend("bottomleft",                          # Posição da legenda
       legend = c('Treino', 'Real', 'Previsão'),  # Rótulos
       col = c('black','blue', 'aquamarine'),             # Cores correspondentes
       lty = 1,                             # Tipo de linha
       cex = 0.5)

# Revertendo o log
previsao <- read.csv("dataset/predicao-2025.csv")
previsao$Point.Forecast <- exp(previsao$Point.Forecast)
previsao$Lo.80 <- exp(previsao$Lo.80)
previsao$Hi.80 <- exp(previsao$Hi.80)
previsao$Lo.95 <- exp(previsao$Lo.95)
previsao$Hi.95 <- exp(previsao$Hi.95)


# Salvando as previsões
write.csv(previsao, file = "dataset/predicao-2025-escala.csv", row.names = FALSE)

# Métricas
library('Metrics')
predict <- read.csv('dataset/predicao-2025-escala.csv')
predicted <- predict$Point.Forecast[1:26]

mae <- mae(actual = test[1:1], predicted = predicted[1:1])
rmse <- rmse(actual = test[1:1], predicted = predicted[1:1])
mape <- mape(actual = test[1:1], predicted = predicted[1:1]) * 100
