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
y_train = df[df.ds.dt.year < 2025]

# Treinar e salvar o modelo
model.fit(df=df)
model.save(path="modelo_2025")