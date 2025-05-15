import pandas as pd
from os import getcwd
from pmdarima import auto_arima

df = pd.read_csv(getcwd() + "/fortaleza.csv", index_col="SE")

model = auto_arima(df["casos"], m=54, trace=True)