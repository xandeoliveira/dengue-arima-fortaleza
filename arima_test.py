import pandas as pd
from statsforecast import StatsForecast
# import matplotlib.pyplot as plt

# Carregando dataframe
df = pd.read_csv("fortaleza.csv", index_col="SE")

# Separando dado de teste (ano de 2024)
y_test = df[df.ano == 2024]

# Carregando o modelo treinado anteriormente
model = StatsForecast.load(path="modelo")

y_predict = model.predict(h=52)