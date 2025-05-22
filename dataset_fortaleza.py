import pandas as pd
from os import getcwd

# URL da API do INFODENGUE
url = "https://info.dengue.mat.br/api/alertcity?&disease=dengue&geocode=2304400&disease=dengue&format=csv&ew_start=1&ew_end=53&ey_start=2014&ey_end=2024"
df_fortaleza = pd.read_csv(url, index_col="SE")

# Removendo as variáveis desnecessárias
df_filtrado = df_fortaleza[["data_iniSE","casos"]]
df_filtrado = df_filtrado.rename(columns={"data_iniSE":"ds", "casos":"y"})
df_filtrado["unique_id"] = "1"

# Salvando dataframe...
df_filtrado.to_csv(getcwd() + "/dataset/fortaleza-2024.csv")
