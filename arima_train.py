import pandas as pd
from os import getcwd
from statsforecast import StatsForecast
from statsforecast.models import AutoARIMA

# Busca do Dataframe
df = pd.read_csv(getcwd() + "/fortaleza.csv", index_col="SE")

# Especificação e criação do modelo
models = [AutoARIMA(season_length=52)]
model = StatsForecast(models=models, freq='W')

# Recorte para os dados de treinamento
df["ds"] = pd.to_datetime(df["ds"])
y_train = df[df.ds.dt.year < 2024]

# Treinar e salvar o modelo
model.fit(df=df)
model.save(path="modelo")

# Separando dado de teste (ano de 2024)
y_test = df[df.ano == 2024]

# Carregando o modelo treinado anteriormente
model = StatsForecast.load(path="modelo")

y_predict = model.predict(h=52)