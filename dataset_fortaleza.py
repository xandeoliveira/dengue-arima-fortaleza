import pandas as pd
from os import getcwd

# URL da API do INFODENGUE
url = "https://info.dengue.mat.br/api/alertcity?&disease=dengue&geocode=2304400&disease=dengue&format=csv&ew_start=1&ew_end=53&ey_start=2014&ey_end=2024"
df_fortaleza = pd.read_csv(url)

# Removendo as variáveis desnecessárias
df_filtrado = df_fortaleza[["SE","data_iniSE","casos"]]

# Separação da coluna de dia, mês, ano e semana
df_filtrado["data_iniSE"] = pd.to_datetime(df_filtrado["data_iniSE"])

df_filtrado["ano"] = df_filtrado["data_iniSE"].dt.year
df_filtrado["mes"] = df_filtrado["data_iniSE"].dt.month
df_filtrado["dia"] = df_filtrado["data_iniSE"].dt.day

df_filtrado["semana"] = df_filtrado["SE"].astype(str).str.slice(-2)

# Removendo data_iniSE e tornando SE o index
df_filtrado.drop(columns="data_iniSE", inplace=True)
df = df_filtrado.set_index("SE")

# Salvando dataframe...
df.to_csv(getcwd() + "/fortaleza.csv")
