import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> savePythonScript() async {
  // Get the documents directory
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  // Create the file path
  String filePath = '${documentsDirectory.path}/main.py';

  // Create the file
  File file = File(filePath);

  // Write the Python script content to the file
  String scriptContent = '''
    import sys
    import json
    import argparse
    import os
    from sklearn.ensemble import GradientBoostingRegressor
    import ast
    import yfinance as yf
    yf.pdr_override()


    CMD_SYS_VERSION = 0
    CMD_TO_PREDICT = 1


    def run(command):
        if command["cmd"] == CMD_SYS_VERSION:
            return {
                "sys.version": sys.version,
            }

        if command["cmd"] == CMD_TO_PREDICT:
            os.chdir(os.path.dirname(os.path.abspath(__file__)))

            f = open("ticker.txt", 'r')
            Stock = ast.literal_eval('"'+f.read()+'"')
            f.close()
            f = open("ticker.txt", 'w')
            f.write(" ")
            f.close()

            ticker = yf.Ticker("AMZN").history(period="3y", interval="1wk")
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

            f = open("prediction.txt", 'w')
            f.write(str(prediction[0]))
            f.close()
            return {}

        else:
            return {"error": "Unknown command."}


    if __name__ == "__main__":
        parser = argparse.ArgumentParser()
        parser.add_argument("--uuid")
        args = parser.parse_args()
        stream_start = f"`S`T`R`E`A`M`{args.uuid}`S`T`A`R`T`"
        stream_end = f"`S`T`R`E`A`M`{args.uuid}`E`N`D`"
        while True:
            cmd = input()
            cmd = json.loads(cmd)
            try:
                result = run(cmd)
            except Exception as e:
                result = {"exception": e.__str__()}
            result = json.dumps(result)
            print(stream_start + result + stream_end)

''';
  await file.writeAsString(scriptContent);
  if (File(filePath).existsSync()) {
    log(filePath);
  }
}
