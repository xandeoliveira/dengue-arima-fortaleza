import pandas as pd
from os import getcwd
from statsforecast import StatsForecast
from statsforecast.models import AutoARIMA

df = pd.read_csv(getcwd() + "/fortaleza.csv", index_col="SE")


