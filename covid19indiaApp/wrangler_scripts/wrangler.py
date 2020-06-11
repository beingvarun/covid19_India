import pandas as pd

def hello():
    data = pd.read_csv('https://api.covid19india.org/csv/latest/state_wise_daily.csv')
    return data.columns
