import sys
from sklearn.ensemble import GradientBoostingRegressor
import yfinance as yf
yf.pdr_override()

Stock = sys.argv[1]

ticker = yf.Ticker(Stock).history(period="3y", interval="1wk")
if (ticker.__contains__('Dividends')):
    del ticker['Dividends']
if (ticker.__contains__('Stock Splits')):
    del ticker['Stock Splits']
ticker['Tomorrow'] = ticker['Close'].shift(-1)
ticker['Goes'] = (ticker['Tomorrow'] > ticker['Close']).astype(int)

predictionCases = 1
train = ticker.iloc[:-predictionCases]
toPredict = ticker.iloc[-predictionCases:]
predictors = ['Open', 'High', 'Low', 'Close', 'Volume', 'Goes']
y = train['Tomorrow']

model = GradientBoostingRegressor(
    learning_rate=0.1, max_depth=3, n_estimators=100)
model.fit(train[predictors], y)

prediction = model.predict(toPredict[predictors])

prediction = (prediction[0] > ticker['Tomorrow'].shift(-1)).astype(int)

data = prediction[0]
print(data)
